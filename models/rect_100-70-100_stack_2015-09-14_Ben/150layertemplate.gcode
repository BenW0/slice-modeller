;(****Build and Slicing Parameters****)
;(Pix per mm X            = 18.82353 px/mm )
;(Pix per mm Y            = 14.02597 px/mm )
;(X Resolution            = 1920 )
;(Y Resolution            = 1080 )
;(Layer Thickness         = 0.10000 mm )
;(Layer Time              = 12000 ms )
;(Bottom Layers Time        = 12000 ms )
;(Number of Bottom Layers = 1 )
;(Blanking Layer Time     = 3200 ms )
;(Build Direction         = Bottom_Up)
;(Lift Distance           = 1 mm )
;(Slide/Tilt Value        = 0)
;(Anti Aliasing           = False)
;(Use Mainlift GCode Tab  = False)
;(Anti Aliasing Value     = 1.5 )
;(Z Lift Feed Rate        = 60.00000 mm/s )
;(Z Lift Retract Rate     = 100.00000 mm/s )
;(Flip X                  = False)
;(Flip Y                  = False)
;Number of Slices        =  150
;(****Machine Configuration ******)
;(Platform X Size         = 102mm )
;(Platform Y Size         = 77mm )
;(Platform Z Size         = 100mm )
;(Max X Feedrate          = 100mm/s )
;(Max Y Feedrate          = 100mm/s )
;(Max Z Feedrate          = 100mm/s )
;(Machine Type            = UV_DLP)
;********** Header Start ********
;Here you can set any G or M-Code which should be executed BEFORE the build process
G21 ;Set units to be mm
G91 ;Relative Positioning
M17 ;Enable motors
g01z0.1
;********** Header End **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 0 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 1 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 2 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 3 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 4 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 5 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 6 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 7 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 8 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 9 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 10 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 11 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 12 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 13 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 14 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 15 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 16 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 17 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 18 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 19 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 20 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 21 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 22 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 23 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 24 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 25 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 26 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 27 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 28 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 29 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 30 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 31 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 32 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 33 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 34 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 35 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 36 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 37 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 38 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 39 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 40 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 41 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 42 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 43 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 44 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 45 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 46 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 47 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 48 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 49 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 50 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 51 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 52 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 53 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 54 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 55 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 56 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 57 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 58 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 59 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 60 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 61 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 62 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 63 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 64 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 65 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 66 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 67 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 68 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 69 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 70 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 71 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 72 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 73 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 74 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 75 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 76 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 77 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 78 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 79 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 80 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 81 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 82 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 83 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 84 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 85 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 86 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 87 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 88 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 89 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 90 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 91 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 92 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 93 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 94 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 95 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 96 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 97 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 98 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 99 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 100 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 101 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 102 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 103 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 104 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 105 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 106 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 107 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 108 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 109 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 110 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 111 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 112 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 113 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 114 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 115 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 116 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 117 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 118 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 119 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 120 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 121 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 122 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 123 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 124 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 125 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 126 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 127 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 128 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 129 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 130 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 131 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 132 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 133 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 134 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 135 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 136 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 137 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 138 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 139 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 140 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 141 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 142 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 143 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 144 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 145 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 146 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 147 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 148 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 149 
;<Delay> 12000 
;<Slice> Blank 
;********** Lift Sequence ********
G1 Z1.0 F60.0
G1 Z-.9 F100.0
;<Delay> 3200
;********** Lift Sequence **********
;********** Footer Start ********
;Here you can set any G or M-Code which should be executed after the last Layer is Printed
g01z10
M18 ;Disable Motors
;<Completed>
;********** Footer End ********
