if live_call() return live_result;

event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	draw_clear_alpha(c_white, 1);
	draw_rectangle_colour(0,0,128,128,$2e1814,$2e1814,$2e1814,$2e1814,0);
	
	draw_surface(childrenObjectSurf, 0, 0)
	surface_reset_target();
}
