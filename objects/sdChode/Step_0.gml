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

if y>GAME_HEIGHT+sprite_yoffset {
	active=false;
	if y>GAME_HEIGHT*3 instance_destroy();
}