if live_call() return live_result;

event_inherited();

switch state {
	case 0:
		var l=.2;
		x=lerp(x, gotoX, l);
		y=lerp(y, gotoY, l);
		if point_distance(x, y, gotoX, gotoY)<2 {
			x=gotoX;
			y=gotoY;
			state=1;
		}
	break;
}

timer++;
if timer%30==0 {
	angle+=1;
}

if x!=clamp(x, 0, GAME_WIDTH) || y!=clamp(y, -GAME_HEIGHT*2, GAME_HEIGHT) {
	active=false;
}

//show_debug_message(concat(x, ", ", y));