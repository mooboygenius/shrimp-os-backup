if live_call() return live_result;

event_inherited();

switch state {
	case 0:
		var l=.15,
		xsg=1.5;
		angle=lerp(angle, 0, l);
		xScale=lerp(xScale, xsg, l);
		if angle<2 {
			state=1;
			angle=0;
			xScale=xsg;
			grace=4;
			setCameraShake(2);
		}
	break;
	
	case 1:
		xScale=lerp(xScale, 1, .2);
		angle=lerp(angle, wave(-1, 1, 1)*20, .5);
	break;
}

drawScript=function(x, y) {
	defaultDrawScript(drawX, drawY);
}

yScale=xScale;