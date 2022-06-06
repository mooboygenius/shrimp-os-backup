if live_call() return live_result;

event_inherited();

state=0;
timer=0;

drawScript=function(dx, dy) {
	defaultDrawScript(dx, dy+wave(-2, 2, 1))
}