if live_call() return live_result;

if instance_exists(mumbaPitchforkProjectile) {
	x=-999;
	y=-999;
	fireTimer=max(fireTimer, 25);
}

event_inherited();

with newBullet {
	xScale=sign(other.xScale);
	angle=-xScale*180;
	angle=0;
	angleIncrease=-sign(other.xScale)*7;
}
newBullet=noone;