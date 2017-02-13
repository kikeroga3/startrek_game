; THE DICE

	title "HIT SPACE KEY or MOUSE CLICK!"

	repeat
		stick key
		if key & 272 :gosub *dice
		wait 10
	loop
stop

*dice
	color :boxf 0,0,640,480
	color 255,255,255 :boxf 320-80,240-80,320+80,240+80
	r=rnd(6)+1
	if r=1 {
		color 255,0,0
		boxf 320-16,240-16,320+16,240+16
	}
	color
	if r>1 {
		boxf 320+40,240-60,320+60,240-40
		boxf 320-60,240+40,320-40,240+60
	}
	if r=3 or r=5 {
		boxf 320-10,240-10,320+10,240+10
	}
	if r>3 {
		boxf 320-60,240-60,320-40,240-40
		boxf 320+40,240+40,320+60,240+60
	}
	if r=6 {
		boxf 320-60,240-10,320-40,240+10
		boxf 320+40,240-10,320+60,240+10
	}
	return

