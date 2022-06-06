if live_call() return live_result;

event_inherited();

if gameFrame%30==0 {
	xScale+=.3;
	yScale=xScale;
}

var px=0,
py=0;
with sdPlayer {
	px=x;
	py=y;
}
if point_distance(x, y, px, py)<64 {
	var l=.05;
	x=lerp(x, px, l);
	y=lerp(y, py, l);
}