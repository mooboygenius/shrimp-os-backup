if live_call() return live_result;

if surface_exists(surf) {
	draw_surface_ext(surf, 0, 0, WINDOW_SCALE, WINDOW_SCALE, 0, c_white, 1);
	surface_set_target(surf);
	draw_clear_alpha(0, 0);
	draw_set_font(shrimpDefenderFont);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	surface_reset_target();
} else {
	surf=surface_create(GAME_WIDTH, GAME_HEIGHT);
}