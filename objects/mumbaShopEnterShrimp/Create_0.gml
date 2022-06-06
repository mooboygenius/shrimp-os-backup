if live_call() return live_result;

event_inherited();

back1=instance_create_depth(0, 0, 0, mumbaUnderwaterBackground);
back2=instance_create_depth(0, 0, 0, mumbaUnderwaterBackground);
back3=instance_create_depth(0, 0, 0, mumbaUnderwaterBackground);
with back1 {
	loops=true;
	sprite_index=sprMumbaShrimpBack1;
	cameraXMultiplier=.3;
}
with back2 {
	loops=true;
	sprite_index=sprMumbaShrimpBack2;
	cameraXMultiplier=.5;
}
with back3 {
	loops=true;
	sprite_index=sprMumbaShrimpBack3;
	cameraXMultiplier=.7;
}
ds_list_add(children, back1, back2, back3);