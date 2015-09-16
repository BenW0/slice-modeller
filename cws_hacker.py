#-------------------------------------------------------------------------------
# Name:        module1
# Purpose:     Modifies CreationWorkshop CWS files to contain your own image
#                 stack data.
#
# Author:      Ben
#
# Dependencies: This code requires imagemagick to be installed in your system path.
#
# Created:     06/02/2015
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
#
# Command line usage: This code can be run from the command line:
# cws_hacker.py <template> <first_image> <output>
# where <template> is the template CWS stack,
#       <first_image> is the first image in your image stack, and
#       <output> is the path to the CWS file to be created.
#-------------------------------------------------------------------------------
import sys
if sys.version_info.major == 2 :
    import Tkinter, tkFileDialog
else :
    import tkinter as Tkinter
    import tkinter.filedialog as tkFileDialog
import zipfile
import os
import glob
import subprocess
import re
import types

# ======= Change program behavior with these variables ====== #
NEGATE = False       # invert the colors in the slice images?
THRESHOLD = False       # Threshold the image?
THRESHOLD_VALUE = 50        # % at which to threshold.
REPLICATE_FIRST_IMAGE = False   # If True, just repeat the first image on every layer of the stack.

# Set the following to always choose a specific file for each of the dialogs (and skip displaying the dialog)
OVERRIDE_CWS = "" #r"C:/Users/Ben/OneDrive - UW Office 365/cc/Other/3D printing/CW Scenes/13DP97_100.cws"#r"D:/Doc/My Documents/OneDrive for Business/cc/Other/3D printing/CW Scenes/20mm box.cws"#
OVERRIDE_SLICE = ""  #r"C:\Users\Ben\OneDrive - UW Office 365\cc\Other\3D printing\CW Scenes\BitMaps\SDF-3-New-cropped-halfsize-bitmaps-mono/SDF-3-New-cropped-000023.bmp"#r"D:/Doc/My Documents/OneDrive for Business/cc/Other/3D printing/CW Scenes\BitMaps\SDF-3-New-cropped-halfsize-bitmaps-mono/SDF-3-New-cropped-000023.bmp"#
OVERRIDE_OUTPUT = ""

# regular expressions we'll need:
re_match_path = re.compile(".*[\\\\/]+(?!.*[\\\\/])")
re_match_last_number = re.compile(r"([0-9]+)(?!.*[0-9])")


def main():
    root = Tkinter.Tk()
    root.withdraw()
    
    # get a file to open
    if OVERRIDE_CWS == '' :
        input_cws = tkFileDialog.askopenfilename(filetypes=[('All Files', '.*'),('CWS Files','.cws')], title="Select CWS Template File")
    else :
        input_cws = OVERRIDE_CWS
    
    if not os.path.exists(input_cws) :
        return  # done!
    
    cws_dir = input_cws + ".temp"
    
    
    # get the slice files to use
    if OVERRIDE_SLICE == '' :
        input_slice = tkFileDialog.askopenfilename(filetypes=[('All Files', '.*'), ('Image Files', '.png;.bmp;.tif;.tiff')],title="Select FIRST Slice File")
    else :
        input_slice = OVERRIDE_SLICE
    
    if not os.path.exists(input_slice) :
        return
    
    
    # get the output CWS file to use
    if OVERRIDE_OUTPUT == '' :
        output_cws = tkFileDialog.asksaveasfilename(filetypes=[('All Files', '.*'), ('CWS Files','.cws')], defaultextension='.cws',title="Save output CWS file as...")
    else :
        output_cws = OVERRIDE_OUTPUT
    
    if output_cws == '' :
        return      # cancel!
    
    # Unzip the file
    zf = zipfile.ZipFile(input_cws, "r")
    zf.extractall(cws_dir)
    zf.close()
    
    # get the size of the template images as well as their name form
    imlist = glob.glob(cws_dir + "/*.png")
    
    if len(imlist) == 0 :
        print("Couldn't find any png images in the CWS! Make sure you slice before you save!")
        return
    
    cws_imname = imlist[0]
    
    sizestr = getsizestr(cws_imname)
    sizestr = sizestr[1:-1]     # trim leading & trailing quotes
    if sizestr == "" :
        print("Error getting the size of the CWS template image!")
        return
    # set up the conversion function.
    #  -negate - invert the image colors
    #  -threshold - threshold at 50% brightness (to deal with gray inputs)
    #  -background - set the background of any unused portion of the frame to black
    #  -compose - copy new images on top of background pixels
    #  -gravity - center the new image on the scene
    #  -extent - size of output image (on which the input image will be composited)
    imagemagick_flags = []
    if NEGATE :
        imagemagick_flags.append('-negate')
    if THRESHOLD : 
        imagemagick_flags.extend(['-threshold', ('%u'%THRESHOLD_VALUE) + '%', '-depth', '1'])
    imagemagick_flags.extend(['-background', 'black', '-compose', 'Copy', '-gravity', 'center', '-extent', sizestr])
    
    
    # figure out how long the numbers are (by testing length of result on first slice)
    result = re_match_last_number.search(input_slice)
    if result is None :
        print("Couldn't find number in the filename of your slice input.")
        return
    slice_numpad = result.span()[1] - result.span()[0] 
    cws_numpad = 4      # the cws format alwasy uses 4-digit file numbers.


    # Set up the file name templates
    cws_id = 0
    slice_id = int(result.group())
    next_cws_in = cws_imname[:-8] + "0000.png"
    next_slice = input_slice
    # figure out the name of the output image
    first_cws_out = re_match_path.match(cws_imname).group() + re_match_path.sub("", output_cws)[:-4] + "0000.png"
    next_cws_out = first_cws_out
    
    # check that we have enough slices in the cws to incorporate the whole slice stack.
    # figure out how many images are in the set of slice images
    slice_count = countsliceimages(input_slice, slice_numpad, slice_id)
    leftover_slices = slice_count - len(imlist)
    if len(imlist) < slice_count :
        print("There are not enough slices in the CWS to fill all the slices in your dataset! %u slices will be lost" % leftover_slices)
    
        
    # go through the files until we run out of source or destination filenames.
    # CW is strange in that the names of the image files need to match the name
    # of the output archive, not the input!
    while os.path.exists(next_cws_in) and os.path.exists(next_slice) :
        print("Converting %s\r" % next_slice)
        # filter the slice and copy it onto the cws:
        args = ["convert", next_slice]
        args.extend(imagemagick_flags)
        args.append(next_cws_out)
        subprocess.call(args, shell=True)
        
        # delete the input cws image file if it is different than the output cws image file
        if re_match_path.sub("",next_cws_in).lower() != re_match_path.sub("",next_cws_out).lower() :
            #pass
            os.remove(next_cws_in)
        
        # figure out the next filenames based on the current ones.
        cws_id += 1
        if not REPLICATE_FIRST_IMAGE :
            slice_id += 1
        next_cws_out = first_cws_out[:-8] + ("%04i" % cws_id) + ".png"
        next_cws_in = cws_imname[:-8] + ("%04i" % cws_id) + ".png"
        next_slice = re_match_last_number.sub(("%0" + ("%u"%slice_numpad) + "i") % slice_id, input_slice)
    
    # if we ran out of slice files before we ran out of cws slices, set all remaining cws slices to black.
    while os.path.exists(next_cws_in) :
        print("Blanking %s\r" % next_cws_in)
        # filter the slice and copy it onto the cws:
        args = ["convert", "-size", sizestr, "xc:black", next_cws_out]
        subprocess.call(args, shell=True)
        
        # delete the input cws image file if it is different than the output cws image file
        if re_match_path.sub("",next_cws_in).lower() != re_match_path.sub("",next_cws_out).lower() :
            #pass
            os.remove(next_cws_in)
        
        # figure out the next filenames based on the current ones.
        cws_id += 1
        next_cws_out = first_cws_out[:-8] + ("%04i" % cws_id) + ".png"
        next_cws_in = cws_imname[:-8] + ("%04i" % cws_id) + ".png"
    
    
    # re-zip the files into the "new" cws
    filelist = glob.glob(cws_dir + "/*.*")
    zf = zipfile.ZipFile(output_cws, "w")
    for file in filelist :
        zf.write(file, re_match_path.sub("", file))
    zf.close()
    
    # delete the temporary directory
    filelist = glob.glob(cws_dir + "/*.*")
    for file in filelist:
        os.remove(file)
    os.rmdir(cws_dir)
    
    
    print("Done!")
    
    if len(imlist) < slice_count :
        print("There were not enough slices in the CWS to fill all the slices in your dataset! %i slices were be lost" % leftover_slices)
    
    

def getsizestr(imname) :
    # gets the size of the image in a form imagemagick can understand
    return subprocess.check_output(['convert', imname, '-ping', '-format', '"%wx%h"', 'info:'], shell=True)

def countsliceimages(slice_fname, slice_numpad, slice_id) :
    # iterate until we can't find a next matching slice image name.
    next_slice = slice_fname
    count = 0
    
    while os.path.exists(next_slice) :
        # figure out the next filenames based on the current ones.
        slice_id += 1
        count += 1
        next_slice = re_match_last_number.sub(("%0" + ('%i'%slice_numpad) + "i") % slice_id, slice_fname)
    
    return count

if __name__ == '__main__':
    # Check for command line arguments
    if len(sys.argv) == 4:
        # Override the paths with arguments passed:
        OVERRIDE_CWS = sys.argv[1]
        OVERRIDE_SLICE = sys.argv[2]
        OVERRIDE_OUTPUT = sys.argv[3]
        main()
    elif len(sys.argv) == 2 and ("?" in sys.argv[1] or "help" in sys.argv[1] or "Help" in sys.argv[1]):
        # print out the help message:
        print("""Command line usage: cws_hacker.py <template> <first_image> <output>
where <template> is the template CWS stack,
      <first_image> is the first image in your image stack, and
      <output> is the path to the CWS file to be created.""")
    else:
        # run in non-command-line mode
        main()
