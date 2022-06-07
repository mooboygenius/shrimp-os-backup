if live_call() return live_result;

event_inherited();

if playing {
	startX++;
} else {
	//show_debug_message(scrollX);
	startX=-scrollX;
}

xstart=startX+scrollX;

var n=0;
with instrument {
	if playingNow n++;
}
if n>=6 {
	unlockMedal("Cacaphony");
}
//show_debug_message(concat("startx: ", startX, "  scrollx: ", scrollX, "  realx: ", xstart));

var over=true;
with instrument {
	if !played {
		over=false;
	}
}
if over playing=false;

drawScript=function(x, y) {
	draw_sprite_stretched(sprShrimposerPlayerBar, 0, x, 0, 1, 100);
}