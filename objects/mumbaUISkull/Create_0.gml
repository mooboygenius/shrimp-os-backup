if live_call() return live_result;

event_inherited();

state=0;
drawX=0;
drawY=0;

drawScript=function(x, y) {
	defaultDrawScript(drawX, drawY);
}
life=60;
horizontalSpeed=0;
verticalSpeed=0;
rotateDir=0;
image_index=irandom(image_number);