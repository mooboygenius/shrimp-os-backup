if live_call() return live_result;

event_inherited();

back1=instance_create_depth(0, 0, 0, mumbaBackground);
back2=instance_create_depth(0, 0, 0, mumbaBackground);
back3=instance_create_depth(0, 0, 0, mumbaBackground);

var ys=-32;

with back1 {
	loops=true;
	sprite_index=sprMumbaVolcanoSky;
	cameraXMultiplier=0;
}

with back2 {
	loops=true;
	sprite_index=sprMumbaVolcanoBack;
	cameraXMultiplier=.1;
	drawY=ys;
}

with back3 {
	loops=true;
	sprite_index=sprMumbaVolcanoMountains;
	cameraXMultiplier=.3;
	drawY=ys;
}

ds_list_add(children, back1, back2, back3);