## Slice-Modeller
Slice-Modeller is a very simple CAD tool which generates models in the form of image slices from a 3D image stack (similar to how a CT scanner stores data). The input is a json file which contains a description of the model to be rendered, and the output is a stack of images (optionally rendered into a Creation Workshop CWS file).

## Dependencies
This code requires a copy of ImageMagick to be installed and available in the path.


## SECURITY NOTE
This script uses eval() to interpret math in the read-in JSON code.
You shouldn't ever DREAM of letting this code face the real world, or your system
will be hacked super fast!

## Model Description
In a json file (model.json), using a the following syntax. Note that all numeric
quantities are run through eval(), so math should work fine. You probably have to put
it in quotes, though, or things get ugly.

```
{"Stack": {
  "Name":"Test",  <-- Name of the stack. This will be the folder name for the output.
  "Layers":150,  <-- how many layers are in the whole model?
  "Width":500,   <-- how big should each image be?
  "Height":300
  },
  "Primitives":[ <-- lists all the primitives in the model
    {
      "Type":"Rect":     <-- Rectangle object. Parameters are in pixels, should be self-explanatory.
      "Left":50, <-- if Left or Top are omitted, the object is centered on the image.
      "Top":100,
      "Width":200,
      "Height":100,

      "Start":0,  <-- start layer for this primitive
      "End":30,    <-- end layer for this primitive
      "Color":"(255,255,255)"  <-- color. This should be a single number (gray value) or a tuple of R,G,B values.

    },
    {
      "Type":"Ellipse":
      "Cx": 75,  <-- center of the circle, x. If omitted, centers the object on the screen.
      "Cy": 100, <-- center of the circle, y
      "R": 50,    <-- radius of the circle. Can alternatively specify "D" for diameter

      "Start":30,
      "End":60,
     "Color":"(255,255,255)"
    },
    }
     "Type":"Cylinder",  <-- Cylinders let you change the start and end characteristics, linearly
                             interpolating between them layer by layer.
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
  ]
}
```