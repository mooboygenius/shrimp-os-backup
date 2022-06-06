if live_call() return live_result;

// Inherit the parent event
event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	draw_clear_alpha(WINDOW_COLOR, 1);
	if surface_exists(childrenObjectSurf) draw_surface(childrenObjectSurf, 0, 0);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fntSystem);
	var c=BLACK_COLOR,
	tx=portWidth div 2+random_range(-1, 1),
	ty=portHeight div 4+random_range(-2, 2);
	draw_text_color(tx, ty, "STOP opening so many\ngoddamn windows", c, c, c, c, 1);
	with okButton {
		xstart=other.portWidth div 2;
		ystart=3/4*other.portHeight;
		depth=other.depth-10;
	}
	surface_reset_target();
}