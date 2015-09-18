__author__ = 'Ben'
# Slice Modeller - generates slice files based on some simple, text-based directives, defined
# Ben Weiss 2015
#
#
# License: MIT License:
#
#    Copyright (c) 2015 Ben Weiss, University of Washington
#
#
#    Permission is hereby granted, free of charge, to any person obtaining a
#    copy of this software and associated documentation files (the "Software"),
#    to deal in the Software without restriction, including without limitation
#    the rights to use, copy, modify, merge, publish, distribute, sublicense,
#    and/or sell copies of the Software, and to permit persons to whom the
#    Software is furnished to do so, subject to the following conditions:
#
#    The above copyright notice and this permission notice shall be included
#    in all copies or substantial portions of the Software.
#
#    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
#    THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
#    FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
#    DEALINGS IN THE SOFTWARE.
#
#-------------------------------------------------------------------------------
#
#
# SECURITY NOTE: This script uses eval() to interpret math in the read-in JSON code.
# You shouldn't ever DREAM of letting this code face the real world, or your system
# will be hacked super fast!
#
# in a json file (model.json), using a the following syntax. Note that all numeric
# quantities are run through eval(), so math is fine with me! You probably have to put
# it in quotes, though, or things get ugly.
#{"Stack": {
#   "Name":"Test",  <-- Name of the stack. This will be the folder name for the output.
#   "Layers":150,  <-- how many layers are in the whole model?
#   "Width":500,   <-- how big should each image be?
#   "Height":300
#   },
#   "Primitives":[ <-- lists all the primitives in the model
#     {
#       "Type":"Rect":     <-- Rectangle object. Parameters are in pixels, should be self-explanatory.
#       "Left":50, <-- if Left or Top are omitted, the object is centered on the image.
#       "Top":100,
#       "Width":200,
#       "Height":100,
#
#       "Start":0,  <-- start layer for this primitive
#       "End":30,    <-- end layer for this primitive
#       "Color":"(255,255,255)"  <-- color. This should be a single number (gray value) or a tuple of R,G,B values.
#
#     },
#     {
#       "Type":"Ellipse":
#       "Cx": 75,  <-- center of the circle, x. If omitted, centers the object on the screen.
#       "Cy": 100, <-- center of the circle, y
#       "R": 50,    <-- radius of the circle. Can alternatively specify "D" for diameter
#
#       "Start":30,
#       "End":60,
#      "Color":"(255,255,255)"
#     },
#     }
#      "Type":"Cylinder",  <-- Cylinders let you change the start and end characteristics, linearly
#                              interpolating between them layer by layer.
#      "Base":"Rect",  - or -          "Base":"Ellipse"
#
#      "Left1":50,     - or -          "Cx1":50
#      "Top1":100,                     "Cy1":50
#      "Width1":200,   - or -          "R1":30      - or -      "D1":15
#      "Height1":100,
#      "Color1":"(255,255,255)"
#      
#      "Left2":50,     - or -          "Cx2":50
#      "Top2":100,                     "Cy2":50
#      "Width2":200,   - or -          "R2":30      - or -      "D2":15
#      "Height2":100,
#      "Color2":"(255,255,255)"
# 
#      "Start":0,
#      "End":30,
#   ]
# }

import json
import os
import subprocess
import sys
from math import *      # not used directly by the script, but useful for eval() of user's queries
import re
import numbers


# Model file... FUTURE: Turn this into a dialog.
MODEL_FOLDER = os.path.abspath(os.path.join(".", "models"))
model = "model.json"

# path to ImageMagick. Leave blank if it's in your path and nobody else has a tool named convert.
imagemagick_path = r""


# utility functions
def numeric_param(param):
    """Checks if param is string and runs it through eval()."""
    if type(param) is str or type(param) is unicode:
        return eval(param)
    else:
        return param


def parse_color(param):
    """Parses a color into a tuple of R,G,B values"""
    # trim off any leading rgb (from legacy rgb(180,180,180))
    if param[0:3].lower() == "rgb":
        param = param[3:]
    # check: is it already a tuple?
    if re.match("\(.*,.*,.*\)", param) is None:
        # treat it as a single value, and make sure it compiles
        if isinstance(eval(param), numbers.Number):
            return (param, param, param)
        else:
            print("Color does not compile to a number: %s" % param)
            return [0, 0, 0]
    else:   # it's a tuple
        splits = re.split("[\)\(,]", param) # should have five pieces: ['', '1', '2', '3', '']
        return [splits[1], splits[2], splits[3]]


class Stack:
    def __init__(self, name, layers, width, height, exec_code):
        self.name = name
        self.layers = layers
        self.width = width
        self.height = height
        self.primitives = []

        # initialize the execution scope for eval() and exec()
        self.globals = {}
        self.locals = {}
        exec("from math import *", self.globals, self.locals)
        self.globals["layer"] = 0    # initialize the layer variable
        exec(exec_code, self.globals, self.locals)


    @classmethod
    def from_json(cls, js):
        """Try to load the stack from a json file"""
        try:
            name = js["Stack"]["Name"]
            layers = numeric_param(js["Stack"]["Layers"])
            width = numeric_param(js["Stack"]["Width"])
            height = numeric_param(js["Stack"]["Height"])
            if "Variables" in js["Stack"]:
                exec_code = js["Stack"]["Variables"]
            else:
                exec_code = ""

            stack = cls(name, layers, width, height, exec_code)

        except:
            print("Unable to parse Stack file!")
            return None

        # Load the list of primitives
        if "Primitives" in js:
            for p in js["Primitives"]:
                prim = Primitive.from_json(stack, p)
                if prim is not None:
                    stack.primitives.append(prim)

        return stack

    def draw(self, outfile="", quiet=False):
        """Draws the image stack to files in the folder specified by outfile, with name self.name.
        If outfile = "", uses self.name for the folder name too. Returns the path of the first
        image created."""

        # first make sure the folder exists.
        if outfile == "":
            outfile = os.path.join(MODEL_FOLDER, self.name)

        if not os.path.exists(outfile):
            os.mkdir(outfile)

        imagemagick_prefix = [os.path.join(imagemagick_path, "convert"), "-size", "%ux%u" % (self.width, self.height), "xc:black", "+antialias"]
        image_name = self.name + "%04u.png"
        for layer in range(self.layers):
            if not quiet:
                print("Generating Layer %u" % layer)
            args = []
            args.extend(imagemagick_prefix)
            # composite all the primitives into a stack of draw commands.
            self.globals["layer"] = layer
            for prim in self.primitives:
                if prim.onlayer(layer):
                    args.extend(prim.draw())
            args.append(os.path.join(outfile, image_name % layer))
            # Call ImageMagick
            subprocess.call(args, shell=True)
            if not quiet:
                print args
        return os.path.join(outfile, image_name % 1)

    def test(self, reffile):
        """Draws the image stack, and compares the results to the images in folder reffile with
        the same name as the stack would normally produce.
        Any images which have pixel differences have a "diff" image saved to in the reffile folder
        with the title "diff000x.png" """

        # Draw the stack to a temporary folder
        self.draw("temp", quiet=True)

        imagemagick_prefix = [os.path.join(imagemagick_path, "compare"), "-metric", "PSNR"]
        imagemagick_postfix = ["-compose", "src"]

        image_name = self.name + "%04u.png"

        samecount = 0
        diffcount = 0

        for layer in range(self.layers):
            args = []
            args.extend(imagemagick_prefix)
            # add the names of the two files to be compared
            args.extend([os.path.join("temp", image_name % layer), os.path.join(reffile, image_name % layer)])
            args.extend(imagemagick_postfix)
            # add the diff file location
            diffname = "diff%04u.png" % layer
            args.extend([os.path.join(reffile, diffname)])

            # check the output of the imagemagick call
            try:
                out = subprocess.check_output(args, shell=True, stderr=subprocess.STDOUT)
            except subprocess.CalledProcessError as e:
                out = e.output

            if "1.#INF" in out:     # This means no difference between the two images
                # The two are identical. Delete the diff image.
                os.remove(os.path.join(reffile, diffname))
                samecount = samecount + 1
            else:
                diffcount = diffcount + 1
                #print("Found differences: %s" % (image_name % layer))

        if diffcount > 0 :
            print("Found %u images.\n%u differences." % (self.layers, diffcount))
        else:
            print("Found %u identical images." % samecount)

        return diffcount


class Primitive:
    def __init__(self, stack, start, end):
        self.stack = stack
        self.start = start
        self.end = end

        self.locals = dict(stack.locals)
        self.locals["start"] = eval(str(self.start), self.stack.globals, self.locals)
        self.locals["end"] = eval(str(self.end), self.stack.globals, self.locals)

    @staticmethod
    def from_json(stack, js):
        """Parses the json object and returns either a Rect or Circ subclass"""
        # First, figure out what kind of file this is.
        if "Type" in js:
            if "Rect" in js["Type"] or "Ellipse" in js["Type"]:
                return SimplePrimitive.from_json(stack, js)
            elif "Cylinder" in js["Type"]:
                return Cylinder.from_json(stack, js)
            else:
                print("Unrecognized primitive type %s" % js["Type"])
        elif "Rect" in js or "Ellipse" in js:
            return SimplePrimitive.from_json(stack, js)
        else:
            print("Invalid model file. Must have one and only one Type item per Primitive")

    def onlayer(self, layer):
        """Returns True if layer is between self.start and self.end, inclusive"""
        start = eval(str(self.start), self.stack.globals, self.locals)
        end = eval(str(self.end), self.stack.globals, self.locals)

        if not(isinstance(start, numbers.Number) and isinstance(end, numbers.Number)):
            print("Start or End didn't evaluate to a number!")
            return False

        return start <= layer <= end

    def draw(self):
        """This method should be overridden and made to do more interesting things..."""
        return []


class SimplePrimitive(Primitive):
    """The SimplePrimitive class implements simple, 2D primitives, which are specified
    as a bounding box with color and layer duration information. Right now, implemented
    SimplePrimitives are Rect and Ellipse. To use them:
    {"Type":"Rect", - or -          "Type":"Ellipse"
     "Left":50,     - or -          "Cx":50
     "Top":100,                     "Cy":50
     "Width":200,   - or -          "R":30      - or -      "D":15
     "Height":100,
     "Start":0,
     "End":30,
     "Color":"(255,255,255)"
    }
    If Left and Cx (and/or Top and Cy) are omitted, the object is centered in the window in that axis.
    """
    RECT = 0
    ELLIPSE = 1

    def __init__(self, stack, kind, left, top, right, bottom, start, end, color):
        Primitive.__init__(self, stack, start, end)
        self.kind = kind
        self.left = left
        self.top = top
        self.right = "%s - 1" % right        # Off by 1 in ImageMagick's implementaiton.
        self.bottom = "%s - 1" % bottom
        self.color = color

    @staticmethod
    def from_json(stack, js):
        try:
            kind = SimplePrimitive.RECT
            if "Type" in js:
                if "ellipse" in str(js["Type"]).lower():
                    kind = SimplePrimitive.ELLIPSE

            else:
                # old style, which uses a nested "Rect" or "Ellipse" object. Un-nest to parse.
                if "Ellipse" in js:
                    js.update(js["Ellipse"])
                    kind = SimplePrimitive.ELLIPSE
                elif "Rect" in js:
                    js.update(js["Rect"])
                    kind = SimplePrimitive.RECT
                else:
                    print("Something fishy's going on!")
                    kind = SimplePrimitive.RECT

            if "R" in js:
                dx = "(%s) * 2" % str(js["R"])
                dy = dx
            elif "D" in js:
                dx = str(js["D"])
                dy = dx
            elif "Width" in js:
                dx = str(js["Width"])
                if "Height" in js:
                    dy = str(js["Height"])
                else:
                    print("Rect or Ellipse with width but no height! Assuming a circle.")
                    dy = dx
            else:
                print("Missing parameter in the Rect or Ellipse construct - please specify R or D or Width and Height!")
                dx = "10"
                dy = "10"

            if "Cx" in js:
                cx = str(js["Cx"])
                left = "%s - (%s)/2" % (cx, dx)
            elif "Left" in js:
                left = str(js["Left"])
            else:
                cx = str(stack.width / 2)
                left = "%s - (%s)/2" % (cx, dx)

            if "Cy" in js:
                cy = str(js["Cy"])
                top = "%s - (%s)/2" % (cy, dy)
            elif "Top" in js:
                top = str(js["Top"])
            else:
                cy = str(stack.height / 2)
                top = "%s - (%s)/2" % (cy, dy)

            if "Start" in js:
                start = str(js["Start"])
            else:
                start = "0"
            if "End" in js:
                end = str(js["End"])
            else:
                end = str(stack.layers)
            color = parse_color(js["Color"])

            right = "%s + %s" % (left, dx)
            bottom = "%s + %s" % (top, dy)

            return SimplePrimitive(stack, kind, left, top, right, bottom, start, end, color)
        except:
            print "Error parsing SimplePrimitive in JSON file!"
            return None

    def draw(self):
        """Generates the imagemagick code for this rectangle."""
        # Occasional single-pixel weirdness may occur because of rounding here...
        out = Primitive.draw(self)
        # Evaluate the left, top, right and bottom expressions on the current layer and
        # round to the nearest pixel.
        left = eval(self.left, self.stack.globals, self.locals)
        top = eval(self.top, self.stack.globals, self.locals)
        right = eval(self.right, self.stack.globals, self.locals)
        bottom = eval(self.bottom, self.stack.globals, self.locals)
        color_r = eval(str(self.color[0]), self.stack.globals, self.locals)
        color_g = eval(str(self.color[1]), self.stack.globals, self.locals)
        color_b = eval(str(self.color[2]), self.stack.globals, self.locals)

        if not(isinstance(left, numbers.Number) and isinstance(right, numbers.Number) and
                isinstance(top, numbers.Number) and isinstance(bottom, numbers.Number) and
                isinstance(color_r, numbers.Number) and isinstance(color_g, numbers.Number) and
                isinstance(color_b, numbers.Number) ):
            print("Invalid expressions! Left, Top, Right, or Bottom did not evaluate to a number!")
            return out

        left = round(left, 0)
        top = round(top, 0)
        right = round(right, 0)
        bottom = round(bottom, 0)
        color_r = round(color_r, 0)
        color_g = round(color_g, 0)
        color_b = round(color_b, 0)

        if self.kind == SimplePrimitive.ELLIPSE:
            out.extend(["-fill", "rgb(%u,%u,%u)" % (color_r, color_g, color_b), "-stroke", "none", "-draw",
                        "arc %.1f,%.1f %.1f,%.1f 0,360" %
                        (left, top, right, bottom)])
        else:
            out.extend(["-fill", "rgb(%u,%u,%u)" % (color_r, color_g, color_b), "-stroke", "none", "-draw",
                        "rectangle %.1f,%.1f %.1f,%.1f" %
                        (left, top, right, bottom)])

        return out


class Cylinder(SimplePrimitive):
    """The Cylinder primitive is a more complex version of SimplePrimitive. SimplePrimitive
    only draws the same ellipse on a series of layers. Cylinder allows you to specify
    the beginning and end state of the primitive that makes up the object.
    Structure:
    {"Type":"Cylinder",
     "Base":"Rect",  - or -          "Base":"Ellipse"
     "Left1":50,     - or -          "Cx1":50
     "Top1":100,                     "Cy1":50
     "Width1":200,   - or -          "R1":30      - or -      "D1":15
     "Height1":100,
     "Color1":"(255,255,255)"
     
     "Left2":50,     - or -          "Cx2":50
     "Top2":100,                     "Cy2":50
     "Width2":200,   - or -          "R2":30      - or -      "D2":15
     "Height2":100,
     "Color2":"(255,255,255)"

     "Start":0,
     "End":30,
    }
    If any Left and Cx (and/or Top and Cy) are omitted, the object is centered in the window in that axis.
    If any __2 parameter is omitted, it is assumed to equal the corresponding __1 parameter.
    All parameters are interpolated linearly and evaluated using eval if given as a string.
    The eval() environment includes "from math import *" and a special variable called "layer"
    which contains the current layer number.
    """

    def __init__(self, stack, kind, left1, top1, right1, bottom1, left2, top2, right2, bottom2,
                 start, end, color1, color2):
        self.left1 = left1
        self.top1 = top1
        self.right1 = right1        # The "- 1" gets added in SimplePrimitive's __init__.
        self.bottom1 = bottom1
        self.left2 = left2
        self.top2 = top2
        self.right2 = right2        # The "- 1" gets added in SimplePrimitive's __init__.
        self.bottom2 = bottom2
        self.color1 = color1
        self.color2 = color2

        # Build the interpolators to feed to SimplePrimitive's __init__.
        self.interp = "interp = float(layer - start) / (end - start)"     # we will run this on each layer
        interp_eqn = "(%s) + interp * float(%s - (%s))"
        left = interp_eqn % (self.left1, self.left2, self.left1)
        top = interp_eqn % (self.top1, self.top2, self.top1)
        right = interp_eqn % (self.right1, self.right2, self.right1)
        bottom = interp_eqn % (self.bottom1, self.bottom2, self.bottom1)
        color = [interp_eqn % (self.color1[0], self.color2[0], self.color1[0]),
                 interp_eqn % (self.color1[1], self.color2[1], self.color1[1]),
                 interp_eqn % (self.color1[2], self.color2[2], self.color1[2])]

        SimplePrimitive.__init__(self, stack, kind, left, top, right, bottom, start, end, color)

    @staticmethod
    def from_json(stack, js):
        """Parses a Cylinder from a JSON file"""
        #try:
        kind = SimplePrimitive.RECT
        if "Base" in js:
            if "ellipse" in str(js["Base"]).lower():
                kind = SimplePrimitive.ELLIPSE

        if "R1" in js:
            dx1 = "(%s) * 2" % str(js["R1"])
            dy1 = dx1
        elif "D1" in js:
            dx1 = str(js["D1"])
            dy1 = dx1
        elif "Width1" in js:
            dx1 = str(js["Width1"])
            if "Height1" in js:
                dy1 = str(js["Height1"])
            else:
                print("Cylinder with width but no height! Assuming a circle.")
                dy1 = dx1
        else:
            print("Missing start size parameter in the Cylinder construct - please specify R or D or Width and Height!")
            dx1 = "10"
            dy1 = "10"

        if "Cx1" in js:
            cx1 = str(js["Cx1"])
            left1 = "%s - (%s)/2" % (cx1, dx1)
        elif "Left1" in js:
            left1 = str(js["Left1"])
        else:
            cx1 = str(stack.width / 2)
            left1 = "%s - (%s)/2" % (cx1, dx1)

        if "Cy1" in js:
            cy1 = str(js["Cy1"])
            top1 = "%s - (%s)/2" % (cy1, dy1)
        elif "Top1" in js:
            top1 = str(js["Top1"])
        else:
            cy1 = str(stack.height / 2)
            top1 = "%s - (%s)/2" % (cy1, dy1)
        color1 = parse_color(js["Color1"])

        if "R2" in js:
            dx2 = "(%s) * 2" % str(js["R2"])
            dy2 = dx2
        elif "D2" in js:
            dx2 = str(js["D2"])
            dy2 = dx2
        elif "Width2" in js:
            dx2 = str(js["Width2"])
            if "Height2" in js:
                dy2 = str(js["Height2"])
            else:
                print("Cylinder with width but no height! Assuming a circle.")
                dy2 = dx2
        else:
            # assume end size is the same as start size. This might be useful if you
            # just wanted to move the position of the top of the cylinder.
            dx2 = dx1
            dy2 = dy1

        if "Cx2" in js:
            cx2 = str(js["Cx2"])
            left2 = "%s - (%s)/2" % (cx2, dx2)
        elif "Left2" in js:
            left2 = str(js["Left2"])
        else:
            cx2 = str(stack.width / 2)
            left2 = "%s - (%s)/2" % (cx2, dx2)

        if "Cy2" in js:
            cy2 = str(js["Cy2"])
            top2 = "%s - (%s)/2" % (cy2, dy2)
        elif "Top2" in js:
            top2 = str(js["Top2"])
        else:
            cy2 = str(stack.height / 2)
            top2 = "%s - (%s)/2" % (cy2, dy2)
        color2 = parse_color(js["Color2"])

        if "Start" in js:
            start = str(js["Start"])
        else:
            start = "0"
        if "End" in js:
            end = js["End"]
        else:
            end = stack.layers

        right1 = "%s + %s" % (left1, dx1)
        bottom1 = "%s + %s" % (top1, dy1)
        right2 = "%s + %s" % (left2, dx2)
        bottom2 = "%s + %s" % (top2, dy2)

        return Cylinder(stack, kind, left1, top1, right1, bottom1,
                        left2, top2, right2, bottom2, start, end, color1, color2)
        # except:
        #     print "Error parsing Cylinder in JSON file!"
        #     return None

    def draw(self):
        """Generates the imagemagick code for this cylinder."""
        # First, evaluate the interp equation to get the interp variable for this layer.
        exec(self.interp, self.stack.globals, self.locals)

        # Now let our super do the rest.
        return SimplePrimitive.draw(self)


def compile_model(modelfile, quiet=False):
    """Loads a model file and builds the image stack it describes. Returns the path to the first image created."""
    # try to load the json file model
    with open(modelfile, "r") as fp:
        js = json.load(fp)
        # try to load a Stack object off this model
        stackobj = Stack.from_json(js)
        if stackobj is None:
            print("Failed to load the stack!")
        else:
            print("Stack Loaded. %u Layers of %ux%u" % (stackobj.layers, stackobj.width, stackobj.height))
            print("Found %u primitives" % len(stackobj.primitives))

            # generate the models.
            return stackobj.draw(quiet=quiet)
    return ""


def check_model(modelfile, refdir=""):
    """Loads a model file and builds the image stack it describes, checking it against the reference files in refdir.
    If refdir is omitted, uses stack.name as a default."""
    # try to load the json file model
    with open(modelfile, "r") as fp:
        js = json.load(fp)
        # try to load a Stack object off this model
        stackobj = Stack.from_json(js)
        if stackobj is None:
            print("Failed to load the stack!")
        else:
            if refdir == "":
                refdir = os.path.join(MODEL_FOLDER, stackobj.name)

            print("Checking stack %s against folder %s" % (stackobj.name, refdir))

            # generate the models.
            return stackobj.test(refdir)
    return 1

if __name__ == "__main__":
    # Main program.

    # check for command line argument of json file to parse
    if sys.argv == 2 and ("?" in sys.argv[1] or "help" in sys.argv[1] or "Help" in sys.argv[1]):
        print("Usage: sliceModeller.py mymodel.json")
        exit()
    if sys.argv == 2:
        model = sys.argv[1]

    compile_model(os.path.join(MODEL_FOLDER, model))
