if live_call() return live_result;

event_inherited();

drawScript=function(x, y) {
	defaultDrawScript(drawX, drawY);
}

var l=.2;
drawX=lerp(drawX, targetX, l);
drawY=lerp(drawY, targetY, l);

targetX+=horizontalSpeed;
targetY+=verticalSpeed;
drawX+=horizontalSpeed;
drawY+=verticalSpeed;
timer+=timeChange;
if timer<=0 instance_destroy();