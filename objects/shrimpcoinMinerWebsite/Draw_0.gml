if live_call() return live_result;

event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	draw_clear_alpha(WHITE_COLOR, 1);
	draw_set_font(fntFancy);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_color(4, 12, "Tell nobody.", BLACK_COLOR, BLACK_COLOR, BLACK_COLOR, BLACK_COLOR, 1);
	surface_reset_target();
}