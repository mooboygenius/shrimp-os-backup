if live_call() return live_result;

// Inherit the parent event
event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	draw_sprite_tiled(sprShrimpPaintBackground, 0, 0, scrollYLerp);
	draw_sprite_stretched(sprShrimpPaintLogo, 0, 0, 8+scrollYLerp, portWidth, sprite_get_height(sprShrimpPaintLogo));
	var bx=portWidth-20,
	by=scrollYLerp+24;
	with helpButton {
		xstart=bx;
		ystart=by;
		bx-=sprite_width+12;
	}
	with downloadButton {
		xstart=bx;
		ystart=by;
	}
	draw_surface(childrenObjectSurf, 0, 0);
	surface_reset_target();
}