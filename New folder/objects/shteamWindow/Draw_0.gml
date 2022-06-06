if live_call() return live_result;

event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	draw_clear_alpha(0, 0);
	draw_sprite(sprShteamLogo, 0, 0, scrollYLerp);
	if surface_exists(childrenObjectSurf) {
		draw_surface(childrenObjectSurf, 0, 0);
	}
	surface_reset_target();
}