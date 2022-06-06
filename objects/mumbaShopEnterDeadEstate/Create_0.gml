if live_call() return live_result;

event_inherited();

back1=instance_create_depth(0, 0, 0, mumbaBackground);
with back1 {
	loops=true;
	sprite_index=sprMumbaDeadEstateBackground;
	cameraXMultiplier=.2;
}


ds_list_add(children, back1);