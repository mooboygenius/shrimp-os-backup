if live_call() return live_result;

if place_meeting(x+horizontalSpeed, y, mumbaWall) horizontalSpeed*=-1;

event_inherited();

switch state {
	case 0:
		if fakeHp<=0 {
			fakeHp=maximumHp;
			originalHorizontalSpeed=horizontalSpeed;
			horizontalSpeed=0;
			verticalSpeed=0;
			verticalKnockback=-3;
			setSprite(self, sprMumbaTurtleFlipped);
			grace=20;
			squish=.5;
			setCameraShake(2);
			state=1;
			flipped=true;
		}
	break;
	
	case 1:
		if place_meeting(x, y, mumbaPlayer) {
			hp=0;
			fakeHp=0;
			var h=0;
			with mumbaPlayer {
				h=horizontalSpeed;
			}
			horizontalKnockback=h*.8;
			verticalKnockback=-abs(horizontalKnockback);
		}
		timer++;
		if timer>300 {
			timer=0;
			squish=-.5;
			verticalKnockback=-4;
			state=2;
			setSprite(self, sprMumbaTurtleHiding);
		}
	break;
	
	case 2:
		if place_meeting(x, y+1, mumbaWall) {
			setSprite(self, sprMumbaTurtleGetBackUp);
		}
	break;
}

hurtPlayerWhileTouching=!flipped;