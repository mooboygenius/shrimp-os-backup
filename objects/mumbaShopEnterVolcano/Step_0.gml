if live_call() return live_result;

event_inherited();

if ds_exists(children, ds_type_list) {
	if gameFrame%10==0 {
		show_debug_message("huh");
		var inst=instance_create_depth(0, 64, -10, mumbaVolcanoShopNPC);
		ds_list_add(children, inst);
		with parentWindow {
			ds_list_add(children, inst);
		}
	}
}

if !audio_is_playing(sfxMumbaRumble) playSound(sfxMumbaRumble);

with parentWindow {
	cameraShake=1;
}