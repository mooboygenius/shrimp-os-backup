if live_call() return live_result;

event_inherited();

drawX=-100;
drawY=-100;
targetX=drawX;
targetY=drawY;
width=0;
height=0;
drawScript=function(x, y) {
	defaultDrawScript(drawX, drawY);
}