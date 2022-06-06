if live_call() return live_result;

event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	draw_sprite_tiled(sprShrimpgroundsBackground, 0, 0, 0);
	draw_sprite_stretched(sprShrimpgroundsBanner, 0, 0, 9+scrollYLerp, portWidth, sprite_get_height(sprShrimpgroundsBanner));
	draw_surface(childrenObjectSurf, 0, 0);
	with shrimpgroundsHomeButton {
		xstart=64;
		ystart=19+other.scrollYLerp;
	}
	surface_reset_target();
}