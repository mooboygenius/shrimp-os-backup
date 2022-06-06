if live_call() return live_result;

event_inherited();

switch state {
	case 0:
		if place_meeting(x, y, mumbaPlayer) {
			grace=10;
			state=1;
			squish=-.5;
			timer=60;
			var tx=x, ty=y,
			ogx=x, ogy=y;
			x=-999;
			y=-999;
			with instance_nearest(tx, ty, object_index) {
				grace=other.grace;
				squish=.5;
				timer=other.timer;
				state=1;
				tx=x;
				ty=y;
			}
			x=ogx;
			y=ogy;
			with mumbaPlayer {
				x=tx;
				y=ty;
				squish=-.5;
				grace=5;
				canHurt=60;
			}
			playMumbaSound(sfxMumbaFungusManDeath, 100, 1.5);
			playMumbaSound(sfxMumbaMagicHarp, 100, 1.3);
			setCameraShake(2);
		}
	break;
	
	case 1:
		var mx=x, my=y;
		with mumbaPlayer {
			mx=x;
			my=y;
		}
		if timer<0 && point_distance(x, y, mx, my)>32 {
			timer=0;
			state=0;
		}
	break;
}

timer--;