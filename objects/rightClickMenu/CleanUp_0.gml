if live_call() return live_result;
if surface_exists(windowSurface) {
	surface_set_target(windowSurface);
	draw_clear_alpha(0, 0);
	surface_reset_target();
	surface_free(windowSurface);
}

if surface_exists(passSurface1) {
	surface_set_target(passSurface1);
	draw_clear_alpha(0, 0);
	surface_reset_target();
	surface_free(passSurface1);
}

if surface_exists(passSurface2) {
	surface_set_target(passSurface2);
	draw_clear_alpha(0, 0);
	surface_reset_target();
	surface_free(passSurface2);
}

if surface_exists(passSurface3) {
	surface_set_target(passSurface3);
	draw_clear_alpha(0, 0);
	surface_reset_target();
	surface_free(passSurface3);
}