
	color :boxf 0,0,640,480

	x=320 :y=440 :sc=0 :hp=3
	repeat 16 :ky(cnt)=488 :loop

	repeat
		color :boxf 0,0,640,480

		i=rnd(16)
		if rnd(30)<5 and ky(i)>=480 {
			kx(i)=rnd(600) :ky(i)=0 :ks(i)=8+rnd(8) :ka(i)=rnd(2)
		}

		repeat 16
		if ky(cnt)<480 {
			color 128,128,128*ka(cnt) :boxf kx(cnt)-20,ky(cnt)-20,kx(cnt)+20,ky(cnt)+20
			ky(cnt)=ky(cnt)+ks(cnt)
		}

		if abs(x-kx(cnt))<20 and abs(y-ky(cnt)) {
			ky(cnt)=488
			if ka(cnt) {
				hp=hp-1
			} else {
				sc=sc+1
			}
		}

		loop

		stick key
		if key=1 {
			x=x-8 :if x<20 :x=20
		}
		if key=4 {
			x=x+8 :if x>620 :x=620
		}

		color 80,128,0
		boxf x-20,y-20,x+20,y+20

		title "KAKI="+sc+" LIFE="+hp
		if hp<1 :break

		wait 5
	loop

stop
