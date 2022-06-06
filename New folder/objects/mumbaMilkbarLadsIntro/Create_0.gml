if live_call() return live_result;

event_inherited();

drawX=GAME_WIDTH div 2;
drawY=GAME_HEIGHT div 2;
image_xscale=1;
image_yscale=0;
state=0;
timer=0;

drawScript=function(x, y) {
	defaultDrawScript(drawX+irandom_range(-shake, shake), drawY+irandom_range(-shake, shake));
}

circleTransition=-8;
shake=0;