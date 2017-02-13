title "MAZE"

	randomize
	color :boxf 0,0,640,480
	color 255,255,255
	repeat 16 :x=cnt*8+8
		repeat 16 :y=cnt*8+8
			boxf x,y,x+3,y+3
			a=rnd(4)
			if a=1 :boxf x,y-4,x+3,y-4+3
			if a=2 :boxf x+4,y,x+4+3,y+3
			if a=3 :boxf x,y+4,x+3,y+4+3
			if a=0 :boxf x-4,y,x-4+3,y+3
		loop
	loop
	stop
