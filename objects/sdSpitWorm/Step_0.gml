if live_call() return live_result;

// Inherit the parent event
event_inherited();

switch state {
	case 0:
		var l=.3;
		x=lerp(x, gotoX, l);
		y=lerp(y, gotoY, l);
		if point_distance(x, y, gotoX, gotoY)<2 {
			x=gotoX;
			y=gotoY;
			state=1;
		}
	break;
	
	case 1:
		timer++;
		if timer>40 {
			state=2;
			squish=.2;
			timer=0;
			sprite_index=sprSDSpitWormCheeked;
		}
	break;
	
	case 2:
		timer++;
		if timer>30 {
			if grace<=-3 grace=3;
			var r=.005;
			xScale+=r;
			yScale-=r;
			if timer>60 {
				if !audio_is_playing(sfxSD2Shot) playSound(sfxSD2Shot, 100, random_range(1.3, 1.5));
				timer=0;
				squish=-.5;
				xScale=1;
				yScale=1;
				state=3;
				grace=10;
				sprite_index=sprSDSpitWormSpitty;
				var bx=x, by=y+sprite_yoffset;
				var inst=instance_create_depth(bx, by, depth-1, sdSpitWormProjectile),
				spd=3,
				px=0,
				py=0;
				with sdPlayer {
					px=x;
					py=y;
				}
				var d=point_direction(bx, by, px, py);
				with inst {
					squish=-.2;
					grace=5;
					verticalSpeed=2;
					horizontalSpeed=lengthdir_x(spd, d);
					verticalSpeed=lengthdir_y(spd, d);
					angle=d;
				}
			}
		}
	break;
	
	case 3:
		timer++;
		if timer>25 {
			timer=0;
			state=1;
			squish=.2;
			sprite_index=sprSDSpitWorm;
		}
	break;
}