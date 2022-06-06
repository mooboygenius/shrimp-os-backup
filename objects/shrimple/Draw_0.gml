if live_call() return live_result;

event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	draw_clear_alpha(WHITE_COLOR, 1);
	var sx=portWidth div 2,
	sy=40+wave(-1, 1, 1);
	draw_sprite(sprShrimpleLogo, 0, sx, sy);
	draw_surface(childrenObjectSurf, 0, 0);
	surface_reset_target();
}