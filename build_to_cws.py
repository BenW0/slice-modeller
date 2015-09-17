__author__ = 'Ben'
# Builds json files straight to CWS files using sliceModeller and cws_hacker.
# (c) Ben Weiss, University of Washington 2015
# # License: MIT License:
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

import os
import sys
if sys.version_info.major == 2:
    import Tkinter, tkFileDialog
else:
    import tkinter as Tkinter
    import tkinter.filedialog as tkFileDialog
import re
import sliceModeller
import cws_hacker

OUTPUT_NAME_APPEND = "_2015-09-17_Ben"      # gets appended to the name of the output cws files.
CWS_HACKER_PATH = os.path.abspath(os.path.join(".", "cws_hacker.py"))       # path to cws_hacker.py
OVERRIDE_CWS = ""           # if not "", overrides the CWS template prompt.


def main():
    """Does the compile and build process on a bunch of models"""
    # get a CWS template file to open
    if OVERRIDE_CWS == '':
        input_cws = tkFileDialog.askopenfilename(filetypes=[('CWS Files','.cws'),('All Files', '.*')], title="Select CWS Template File")
    else:
        input_cws = OVERRIDE_CWS

    if not os.path.exists(input_cws) :
        return  # done!

    # Ask for a list of one or more json files to compile.
    input_models = tkFileDialog.askopenfilename(filetypes=[('JSON Files', '*.json'), ('All Files', '*.*')], title="Select Models to Compile", multiple=True)
    if type(input_models) is tuple:
        infiles = input_models
    else:
        infiles = re.findall("(?<=\{)[^\}]*(?=\})", input_models)

    for infile in infiles:
        if os.path.exists(infile):
            # Compile the model
            print("Processing %s" % infile)
            im_file = sliceModeller.compile_model(infile, quiet=True)
            out_file = infile[0:-5] + OUTPUT_NAME_APPEND + ".cws"
            # call the cws_hacker script
            #subprocess.call([CWS_HACKER_PATH, str(input_cws), str(im_file), out_file], shell=True)
            cws_hacker.cws_hack(input_cws, im_file, out_file, quiet=True)
        else:
            print("Couldn't find json file %s" % infile)

if __name__ == "__main__":
    main()