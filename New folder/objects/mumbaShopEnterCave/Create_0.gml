if live_call() return live_result;

event_inherited();

back1=instance_create_depth(0, 0, 0, mumbaBackground);
back2=instance_create_depth(0, 0, 0, mumbaBackground);
with back1 {
	loops=true;
	sprite_index=sprMumbaCavesBack1;
	cameraXMultiplier=.2;
}

with back2 {
	loops=true;
	sprite_index=sprMumbaCavesBack2;
	cameraXMultiplier=.4;
}

ds_list_add(children, back1, back2);