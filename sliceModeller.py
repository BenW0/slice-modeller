__author__ = 'Ben'
# Slice Modeller - generates slice files based on some simple, text-based directives, defined
# Ben Weiss, University of Washington 2015
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
#       "Rect": {    <-- Rectangle object. Parameters are in pixels, should be self-explanatory.
#         "Left":50, <-- if Left or Top are omitted, the object is centered on the image.
#         "Top":100,
#         "Width":200,
#         "Height":100
#       },
#       "Start":0,  <-- start layer for this primitive
#       "End":30,    <-- end layer for this primitive
#       "Color":"rgb(255,255,255)"  <-- color. Any valid ImageMagick color spec works; "blue", "#dddff", "rgb()", etc.
#
#     },
#     {
#       "Circ": {
#         "Cx": 75,  <-- center of the circle, x. If omitted, centers the object on the screen.
#         "Cy": 100, <-- center of the circle, y
#         "R": 50    <-- radius of the circle. Can alternatively specify "D" for diameter
#       },
#       "Start":30,
#       "End":60,
#      "Color":"rgb(255,255,255)"
#     }
#   ]
# }

import json
import os
import subprocess
import sys


# Model file... FUTURE: Turn this into a dialog.
MODEL_FOLDER = "./models"
model = "cyl_70-100-70_stack.json"

# path to ImageMagick. Leave blank if it's in your path and nobody else has a tool named convert.
imagemagick_path = r""


# utility functions
def numeric_param(param):
    """Checks if param is string and runs it through eval()."""
    if type(param) is str or type(param) is unicode:
        return eval(param)
    else:
        return param


class Stack:
    def __init__(self, name, layers, width, height):
        self.name = name
        self.layers = layers
        self.width = width
        self.height = height
        self.primitives = []

    @classmethod
    def from_json(cls, js):
        """Try to load the stack from a json file"""
        try:
            name = js["Stack"]["Name"]
            layers = numeric_param(js["Stack"]["Layers"])
            width = numeric_param(js["Stack"]["Width"])
            height = numeric_param(js["Stack"]["Height"])
            stack = cls(name, layers, width, height)

            # Load the list of primitives
            if "Primitives" in js:
                for p in js["Primitives"]:
                    prim = Primitive.from_json(stack, p)
                    if prim is not None:
                        stack.primitives.append(prim)

            return stack
        except:
            print("Unable to parse Stack file!")

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
            for prim in self.primitives:
                if prim.onlayer(layer):
                    args.extend(prim.draw())
            args.append(os.path.join(outfile, image_name % layer))
            # Call ImageMagick
            subprocess.call(args, shell=True)
            if not quiet:
                print args
        return os.path.join(outfile, image_name % 1)


class Primitive:
    def __init__(self, stack, start, end, color):
        self.stack = stack
        self.start = start
        self.end = end
        #if "(" in color:
        #    color = '"' + color + '"'   # add a quote for imagemagick's benefit.
        self.color = color

    @staticmethod
    def from_json(stack, js):
        """Parses the json object and returns either a Rect or Circ subclass"""
        try:
            # First, try to parse this as a rect.
            if "Rect" in js:
                return Rect.from_json(stack, js)
            elif "Circ" in js > 0:
                return Circ.from_json(stack, js)
            else:
                print("Invalid model file. Must have one and only one Circ or Rect object per Primitive")
        except:
            print("Error parsing JSON file")
            return None

    def onlayer(self, layer):
        """Returns True if layer is between self.start and self.end, inclusive"""
        return self.start <= layer <= self.end

    def draw(self):
        """This method should be overridden and made to do more interesting things..."""
        return []


class Rect(Primitive):
    def __init__(self, stack, left, top, width, height, start, end, color):
        Primitive.__init__(self, stack, start, end, color)
        self.left = left
        self.top = top
        self.right = left + width
        self.bottom = top + height

    @staticmethod
    def from_json(stack, js):
        try:
            width = numeric_param(js["Rect"]["Width"])
            height = numeric_param(js["Rect"]["Height"])
            if "Left" in js["Rect"]:
                left = numeric_param(js["Rect"]["Left"])
            else:
                left = (stack.width - width) / 2
            if "Top" in js["Rect"]:
                top = numeric_param(js["Rect"]["Top"])
            else:
                top = (stack.height - height) / 2
            start = numeric_param(js["Start"])
            if "End" in js:
                end = numeric_param(js["End"])
            else:
                end = stack.layers
            color = js["Color"]

            return Rect(stack, left, top, width, height, start, end, color)
        except:
            print "Error parsing JSON file!"
            return None

    def draw(self):
        """Generates the imagemagick code for this rectangle."""
        out = Primitive.draw(self)
        out.extend(["-fill", self.color, "-stroke", "none", "-draw",
                    "rectangle %u,%u %u,%u" % (self.left, self.top, self.right, self.bottom)])
        return out


class Circ(Primitive):
    def __init__(self, stack, cx, cy, r, start, end, color):
        Primitive.__init__(self, stack, start, end, color)
        self.cx = cx
        self.cy = cy
        self.r = r

    @staticmethod
    def from_json(stack, js):
        try:
            if "Cx" in js["Circ"]:
                cx = numeric_param(js["Circ"]["Cx"])
            else:
                cx = stack.width / 2
            if "Cy" in js["Circ"]:
                cy = numeric_param(js["Circ"]["Cy"])
            else:
                cy = stack.height / 2
            if "R" in js["Circ"]:
                r = numeric_param(js["Circ"]["R"])
            elif "D" in js["Circ"]:
                r = numeric_param(js["Circ"]["D"]) / 2
            else:
                print("Missing parameter in the Circ construct - please specify R or D!")
            start = numeric_param(js["Start"])
            if "End" in js:
                end = numeric_param(js["End"])
            else:
                end = stack.layers
            color = js["Color"]

            return Circ(stack, cx, cy, r, start, end, color)
        except:
            print "Error parsing JSON file!"
            return None

    def draw(self):
        """Generates the imagemagick code for this rectangle."""
        out = Primitive.draw(self)
        out.extend(["-fill", self.color, "-stroke", "none", "-draw",
                    "ellipse %u,%u %u,%u 0,360" % (self.cx, self.cy, self.r, self.r)])
        return out


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


if __name__ == "__main__":
    # Main program.

    # check for command line argument of json file to parse
    if sys.argv == 2 and ("?" in sys.argv[1] or "help" in sys.argv[1] or "Help" in sys.argv[1]):
        print("Usage: sliceModeller.py mymodel.json")
        exit()
    if sys.argv == 2:
        model = sys.argv[1]

    compile_model(os.path.join(MODEL_FOLDER, model))
