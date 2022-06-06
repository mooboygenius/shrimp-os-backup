if live_call() return live_result;

// Inherit the parent event
event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	
	draw_sprite_tiled(sprShrimposerSiteBackground, 0, -4, -4+scrollYLerp);
	
	var lx=portWidth div 2,
	ly=32+scrollYLerp;
	draw_sprite(sprShrimposerLogo, 0, lx, ly);
	
	ly+=24;
	var bd=32;
	with downloadButton {
		xstart=lx-bd;
		ystart=ly;
	}
	with helpButton{
		xstart=lx+bd;
		ystart=ly;
	}
	
	ly+=12;
	draw_line_color(0, ly, portWidth, ly, blueColor, blueColor);
	
	draw_surface(childrenObjectSurf, 0, 0);
	
	surface_reset_target();
}