if live_call() return live_result;

event_inherited();

sprite_index=choose(sprMumbaCrabWalk, sprMumbaSquirrelWalk, sprMumbaRatRun, sprMumbaSnowmanIdle, sprMumbaTurtleWalk);
mask_index=sprite_index;

horizontalSpeed=random_range(1, 3);

switch sprite_index {
	case sprMumbaCrabWalk: horizontalSpeed*=random_range(.8, 1) break;
	case sprMumbaSquirrelWalk: horizontalSpeed*=random_range(.9, 1.1) break;
	case sprMumbaRatRun: horizontalSpeed*=random_range(1.8, 2.1) break;
	case sprMumbaSnowmanIdle: horizontalSpeed*=random_range(.2, .3) break;
	case sprMumbaTurtleWalk: horizontalSpeed*=random_range(.6, .8) break;
}

if chance(.1) {
	horizontalKnockback=random(5);
	verticalSpeed=random_range(-3, -6);
}