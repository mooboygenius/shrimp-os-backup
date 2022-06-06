if live_call() return live_result;

if place_meeting(x, y+verticalSpeed, mumbaWall) {
	horizontalSpeed=lerp(horizontalSpeed, 0, .1);
	angle=lerp(angle, 0, .2);
	if verticalSpeed>1 {
		verticalSpeed*=-.6;
		createMumbaParticle(x, y, mumbaDustParticle);
	}
} else {
	angle+=(verticalSpeed+horizontalSpeed)*5;
}

event_inherited();

life--;
if life<60 && life%4<2 {
	showMe=false;
} else {
	showMe=true;
}

if life<=0 instance_destroy();