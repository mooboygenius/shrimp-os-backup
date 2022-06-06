if live_call() return live_result;

event_inherited();

with newBullet {
	horizontalSpeed*=random_range(.5, 1.1);
	var d=random(360),
	l=random_range(1, 8);
	x+=lengthdir_x(l, d);
	y+=lengthdir_y(l, d);
	grace+=irandom_range(-3, 10);
	squish=random_range(-1, 1)*.5;
	xScale+=random_range(-.1, .8);
	yScale=xScale;
}
newBullet=noone;