if live_call() return live_result;

event_inherited();

with parentWindow {
	other.width=portWidth;
	other.height=portHeight;
}

switch state {
	case 0:
	break;
	
	case 1:
	break;
	
	case 2:
	break;
}

var l=.5;
if point_distance(drawX, drawY, targetX, targetY)<32 l=1;
drawX=lerp(drawX, targetX, l);
drawY=lerp(drawY, targetY, l);