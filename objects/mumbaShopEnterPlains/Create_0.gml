if live_call() return live_result;

event_inherited();

back1=instance_create_depth(0, 0, 0, mumbaBackground);
back2=instance_create_depth(0, 0, 0, mumbaBackground);
back3=instance_create_depth(0, 0, 0, mumbaBackground);
back4=instance_create_depth(0, 0, 0, mumbaBackground);
back5=instance_create_depth(0, 0, 0, mumbaBackground);
with back1 {
	loops=true;
	sprite_index=sprMumbaPlainsSky;
	cameraXMultiplier=0;
}
with back2 {
	loops=true;
	sprite_index=sprMumbaPlainsHills;
	cameraXMultiplier=.1;
}
with back3 {
	loops=true;
	sprite_index=sprMumbaPlains1;
	cameraXMultiplier=.3;
}
with back4 {
	loops=true;
	sprite_index=sprMumbaPlains2;
	cameraXMultiplier=.4;
}
with back5 {
	loops=true;
	sprite_index=sprMumbaPlains3;
	cameraXMultiplier=.5;
}
ds_list_add(children, back1, back2, back3, back4, back5);