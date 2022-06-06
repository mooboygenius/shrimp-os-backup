if live_call() return live_result;

event_inherited();

var px=0,
py=0;
with mumbaPlayer {
	px=x;
	py=y;
}
lookDirection=point_direction(x, y, px, py);