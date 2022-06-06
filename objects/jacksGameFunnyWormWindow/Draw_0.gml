if live_call() return live_result;

event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	
	draw_clear_alpha(WHITE_COLOR, 1);
	
	var sx=sprite_get_xoffset(sprite),
	sy=sprite_get_yoffset(sprite);
	draw_sprite(sprite, 0, sx, sy);
	
	surface_reset_target();
}