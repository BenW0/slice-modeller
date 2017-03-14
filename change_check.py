__author__ = 'Ben'
# Quick script to check whether the results of executing the code change on a particular set of files.
# (c) Ben Weiss 2015
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


import sliceModeller

model_files = ["models/cyl3_70.json", "models/cyl3_100.json", "models/cyl3_70-100-70_stack.json",
               "models/cyl3_13DP96_70_Match.json", "models/cyl3_13DP96_100_Match.json", "models/model.json",
               "models/cyl3x2_100and70_aa.json", "models/cyl3x4_Dw=30_Dg=35.json"]
               # ["models/cyl3_13DP96_70_Match.json"]

problems = 0

for model in model_files:
    problems += sliceModeller.check_model(model)

if problems == 0:
    print("\nAll tests pass!")
else:
    print("\nNot all tests pass. See above!")