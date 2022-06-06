if live_call() return live_result;

if place_meeting(x, y+verticalSpeed, mumbaWall) {
	if verticalSpeed>1 {
		verticalSpeed*=-.8;
		createMumbaParticle(x, y+4, mumbaDustParticle);
		grace=1;
		angle=0;
		squish=.5;
	}
}

angle+=8;

event_inherited();

if hitEnemy {
	horizontalSpeed*=-1;
}