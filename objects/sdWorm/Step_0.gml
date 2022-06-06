if live_call() return live_result;

event_inherited();

switch state {
	case 0:
		if y>=gotoY {
			state=1;
		}
	break;
	
	case 1:
		verticalSpeed=lerp(verticalSpeed, 0, .2);
		timer++;
		if timer>60 {
			timer=0;
			state=2;
		}
	break;
	
	case 2:
		verticalSpeed=lerp(verticalSpeed, 5, .05);
		if y>=GAME_HEIGHT+160 {
			y=-gotoY-160;
			state=0;
			verticalSpeed=2;
		}
	break;
}