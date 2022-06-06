if live_call() return live_result;

horizontalKnockback=0;
verticalKnockback=0;

event_inherited();

var px=0, py=0;
with mumbaPlayer {
	px=x;
	py=y;
}

var a=.5,
spd=1;
if point_distance(x, y, px, py)<96 {
	a=1;
	spd=.5;
}
spd*=moveSpeed;
image_alpha=lerp(image_alpha, a, .2);

var d=point_direction(x, y, px, py),
l=.05;
l*=turnSpeed;
horizontalSpeed=lerp(horizontalSpeed, lengthdir_x(spd, d), l);
verticalSpeed=lerp(verticalSpeed, lengthdir_y(spd, d), l);