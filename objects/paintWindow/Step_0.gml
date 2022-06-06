if live_call() return live_result;

event_inherited();

var in=mouse_wheel_up()-mouse_wheel_down();
if in!=0 {
	drawSize=clamp(drawSize+in, 1, 20);
}