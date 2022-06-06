if live_call() return live_result;

event_inherited();

with transitionFrom {
	if circleSize>320 {
		show_debug_message("haaa");
		instance_destroy();
	}
}


var cx=-100,
d=0;
with myPlayer {
	d=depth;
	cx=x;
}
with cart {
	depth=d-1;
	x=cx-20;
}