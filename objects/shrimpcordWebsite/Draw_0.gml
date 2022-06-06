if live_call() return live_result;

// Inherit the parent event
event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	draw_sprite_tiled(sprShrimpcordSiteBackground, 0, 0, 0);
	var lx=80,
	ly=26+wave(-1, 1, 1);
	draw_sprite(sprShrimpcordSiteLogo, 0, lx, ly);
	
	draw_surface(childrenObjectSurf, 0, 0);
	surface_reset_target();
}