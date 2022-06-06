if live_call() return live_result;

// Inherit the parent event
event_inherited();

if staringAtPlayer {
	var px=0,
	py=0;
	with mumbaPlayer {
		px=x;
		py=y;
	}
	lookDirection=point_direction(x, y, px, py)+random_range(-1, 1)*20;
}