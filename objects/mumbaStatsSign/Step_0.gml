if live_call() return live_result;

event_inherited();

stickToWindow();

show_debug_message(concat(xstart, ", ", ystart));

drawX=72;

switch state {
	case 0:
		drawY=lerp(drawY, 0, .1);
		if drawY>-1 {
			drawY=0;
			state=1;
		}
	break;
	
	case 1:
		angleWave=lerp(angleWave, 5, .01);
		drawY=lerp(drawY, -32, .1);
	break;
}

angleTimer+=20;
angle=lerp(angle, wave(-angleWave, angleWave, 2, 0, angleTimer), .5);
angle=round(angle/.3)*.3;