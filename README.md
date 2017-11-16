# AutodeskTableMatePost
*CR Onsrud Tablemate 2x3 Post Processor for Autodesk*

This is the initial stages of a PostProcessor for the Autodesk CAM Kernel for a CR Onsrud Tablemate 2x3 with B&R Controller. If you would you like to contribute to or refine this, please request an invite

### B & R Controller G&M Code List

```
G00 = Linear movement at rapid feed.
G01 = Linear movement at programmed feed. (F)
G02 = Circular interpolation clockwise.
G03 = Circular interpolation counterclockwise.
G04 = Spindle dwell. (in seconds)
G17 = Sets plane of interpolation to XY plane.
G18 = Sets plane of interpolation to XZ plane.
G19 = Sets plane of interpolation to YZ plane.
G40 = Cutter compensation cancel.
G41 = Cutter compensation left.
G42 = Cutter compensation right.
G53 = Deactivate work offsets.
G54 = Activate work offset G54.
G55 = Activate work offset G55.
G56 = Activate work offset G56.
G57 = Activate work offset G57.
G58 = Activate work offset G58.
G59 = Activate work offset G59.
G70 = Programming in standard units. (in, in/min)
G71 = Programming in metric units. (mm, mm/min)
G90 = Absolute position coordinates.
G91 = Relative position coordinates.
M00 = Program stop.
M01 = Optional program stop.
M02 = End of program.
M03 = Spindle start clockwise with spindle speed. (S)
M04 = Spindle start counterclockwise with spindle speed. (S)
M05 = Spindle stop.
M06 = Tool change.
M30 = End of program with machine park, reset and rewind.
M95 = Designated for I-cut
M96 = Designated for I-cut
M97 = Designated for I-cut
M98 = Dust brushes down.
M99 = Dust brushes up.
M130 = All vacuum zones on. (if equipped with solenoids)
M131 = Vacuum zone 1 on. (if equipped with solenoids)
M132 = Vacuum zone 2 on. (if equipped with solenoids)
M133 = Vacuum zone 3 on. (if equipped with solenoids)
M140 = All vacuum zones off. (if equipped with solenoids)
M141 = Vacuum zone 1 off. (if equipped with solenoids)
M142 = Vacuum zone 2 off. (if equipped with solenoids)
M143 = Vacuum zone 3 off. (if equipped with solenoids)
M341 = Pop-up pin set 1 up. (if equipped with solenoids)
M342 = Pop-up pins set 2 up OR Side rails up. (if equipped with solenoids)
M361 = Pop-up pin set 1 down. (if equipped with solenoids)
M362 = Pop-up pins set 2 down OR Side rails down. (if equipped with solenoids)
L_brtc = Tool change macro.
L_parkz = Parks the Z axis.
L_parkx = Parks the X axis.
L_parkall = Parks the Z axis, then the X&Y axes.
L_brsweep = Cycles the part pusher/sweeper (if equipped)
```
