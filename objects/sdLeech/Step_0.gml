if live_call() return live_result;

event_inherited();

if gotoY>0 {
	gotoY=-gotoY;
	y=gotoY;
	x=gotoX;
	var hsp=6,
	trueY=abs(gotoY)-SD_ROW_START;
	show_debug_message(concat("true y: ", trueY));
	
}

if (horizontalSpeed>0 && x>(GAME_WIDTH+sprite_width)) || (horizontalSpeed<0 && x<(-sprite_width)) {
	horizontalSpeed*=-1;
	y+=32;
	if y>=GAME_HEIGHT {
		y=gotoY;
	}
}

xScale=sign(horizontalSpeed);