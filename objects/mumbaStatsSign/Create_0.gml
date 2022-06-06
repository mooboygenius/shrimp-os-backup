if live_call() return live_result;

event_inherited();

drawX=0;
drawY=0;
drawScript=function(x, y) {
	defaultDrawScript(drawX, drawY);
}
state=0;
timer=0;
angleWave=25;
angleTimer=-30;