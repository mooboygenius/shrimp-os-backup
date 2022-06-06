if live_call() return live_result;

event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	
	draw_clear_alpha($C2A7A3, 1);
	
	draw_set_font(fntSystem);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	var c=BLACK_COLOR;
	draw_text_color(portWidth div 2+random_range(-1, 1), 3+random_range(-1, 1), "Are you SURE you wanna delete\nyour save data??\n(This is irreversible!)", c, c, c, c, 1);
	
	draw_surface(childrenObjectSurf, 0, 0);
	
	var d=40,
	by=portHeight-16,
	bx=portWidth div 2;
	with yesButton {
		ystart=by;
		xstart=bx-d;
	}
	with noButton {
		ystart=by;
		xstart=bx+d;
	}
	
	surface_reset_target();
}