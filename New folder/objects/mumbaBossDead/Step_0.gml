if live_call() return live_result;

event_inherited();

switch state {
	case 0:
		yScale=lerp(yScale, 0, .2);
		timer++;
		if timer>15 {
			timer=0;
			state=1;
			with mumbaLevel {
				other.x=tileSurfaceWidth div 2;
				other.y=tileSurfaceHeight-16*8;
			}
		}
	break;
	
	case 1:
		timer++;
		if timer>15 {
			grace=10;
			timer=0;
			state=2;
			angle=15;
		}
	break;
	
	case 2:
		yScale=lerp(yScale, 1, .3);
		timer++;
		if timer>60 {
			weight=.2;
			state=3;
		}
	break;
	
	case 3:
		angle+=abs(verticalSpeed)*4;
		if place_meeting(x, y+1, mumbaWall) {
			setCameraShake(1);
			angle=0;
			grace=5;
			squish=.5;
			setSprite(self, sprMumbaBossDead2);
			state=4;
		}
	break;
	
	case 4:
		timer++;
		if timer>(3*60) {
			var inst=instance_create_depth(0, 0, -10000, mumbaPostBossBit);
			with parentWindow ds_list_add(children, inst);
			state=5;
		}
	break;
}