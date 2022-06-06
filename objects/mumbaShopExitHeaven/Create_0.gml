if live_call() return live_result;

event_inherited();

back1=instance_create_depth(0, 0, 0, mumbaBackground);
with back1 {
	loops=true;
	sprite_index=sprMumbaHeavenSky;
	cameraXMultiplier=0;
}

back2=instance_create_depth(0, 0, 0, mumbaBackground);
with back2 {
	loops=true;
	sprite_index=sprMumbaHeavenMountains;
	cameraXMultiplier=.3;
}

ds_list_add(children, back1, back2);

repeat(irandom_range(4, 6)) {
	var cloud=instance_create_depth(0, 0, 0, mumbaHeavenCloud);
	with cloud {
		drawY+=random_range(0+sprite_get_yoffset(sprMumbaHeavenClouds), GAME_HEIGHT*.5);
		drawX=random(other.tileSurfaceWidth)+sprite_get_xoffset(sprMumbaHeavenClouds)+random(64);
	}
	ds_list_add(children, cloud);
}