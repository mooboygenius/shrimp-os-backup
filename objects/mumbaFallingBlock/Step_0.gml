if live_call() return live_result;
xstart=x;
ystart=y;

var xo=sprite_width/2,
yo=sprite_height/2;

switch state {
	case 0:
		if place_meeting(x, y-1, mumbaPlayer) {
			grace=10;
			shake=1;
			state=1;
		}
	break;
	
	case 1:
		timer++;
		if timer>30 {
			shake=2;
			if grace<-1 grace=2;
		} else {
			if grace<-5 grace=2;
		}
		if timer>55 {
			squish=-.5;
		}
		if timer>60 {
			repeat(4) {
				createMumbaParticle(startX+xo+random_range(-xo, xo), startY+yo+random_range(-yo, yo), mumbaDustParticle);
			}
			playMumbaSound(sfxMumbaFallingBlock, 100, 1.3);
			timer=0;
			x=-999;
			y=-999;
			shake=0;
			state=2;
		}
	break;
	
	case 2:
		timer++;
		if timer>300 && !place_meeting(startX, startY, mumbaLivingObject) {
			x=startX;
			y=startY;
			state=0;
			grace=5;
			timer=0;
			squish=.5;
			repeat(4) {
				createMumbaParticle(startX+xo+random_range(-xo, xo), startY+yo+random_range(-yo, yo), mumbaDustParticle);
			}
		}
	break;
}


grace--;

squish=lerp(squish, 0, .3);