if live_call() return live_result;

event_inherited();

var width=0, height=0;
with parentWindow {
	width=portWidth;
	height=portHeight;
}

switch state {
	case 0:
		xScale=lerp(xScale, 1, .2);
		timer++;
		if timer%30==0 {
			xScale=1.05;
		}
		yScale=xScale;
		drawX=width div 2;
		drawY=lerp(drawY, targetY+wave(-2, 2, 1), .2);
		angle=round(wave(-1, 1, .5)*2);
	break;
}