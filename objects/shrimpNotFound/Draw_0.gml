event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	draw_clear_alpha(c_white, 1);
	draw_surface(backgroundSurface, 0, 0);
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(fnt404Bold);
	var tx=4,
	ty=12;
	draw_text(tx, ty, "404 - Shrimp not found");
	ty+=string_height("\n");
	draw_set_font(fnt404);
	draw_text(tx, ty, "an index of some shrimpsites\nis available on the home page");
	draw_set_color(c_white);
	surface_reset_target();
}