if live_call() return live_result;

event_inherited();

horizontalSpeed=lerp(horizontalSpeed, 0, .3);
if abs(horizontalSpeed)<=.1 {
	horizontalSpeed=0;
	life--;
} else {
	life=8;
}