title "Landing Game"


x=320 :y=240

*ship
	color 160,160,160
	boxf x-10,y-10,x+10,y+10
	boxf x-10,y+10,x-15,y+15
	boxf x+10,y+10,x+15,y+15
	color 0,255,255
	boxf x-3,y-2,x+3,y+2
	color 255,255,0
	if key & 16 :boxf x-1,y+13,x+1,y+23+rnd(10) :line x,y+13,x+rnd(20)-10,y+13+rnd(10)
	if key & 1 :boxf
	if key & 4 :boxf

stop



randomize

dim map,768		; 32*24=768

repeat 672 :map(96+cnt)=1 :loop		; 32*21=672

stg=15
x=15 :w=11-(stg/2) :if w<5 :w=5

repeat 20
	y=3+cnt :x=x+(rnd(5)-2)
	j=w-(cnt/8)

	repeat j
		i=x-(j/2) :if i<0 :i=0
		map(y*32+i+cnt)=0
	loop

loop

color
repeat 32*24

	x=20*(cnt\32) :y=20*(cnt/32)

	if map(cnt)=0 :boxf x,y,x+19,y+19

loop

stop

