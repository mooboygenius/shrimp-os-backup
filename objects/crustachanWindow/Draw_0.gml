if live_call() return live_result;

// Inherit the parent event
event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	
	draw_clear_alpha(lightColor, 1);
	
	var bx=portWidth div 2,
	by=32+scrollYLerp;
	
	draw_sprite(sprCrustachanBanner, 0, bx, by);
	var c=$452FAD;
	draw_set_font(fntMumbaShop);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	by+=32;
	draw_text_color(bx, by, "/shrimp/ - Shrimp Discussion", c, c, c, c, 1);
	by+=16;
	draw_line_color(0, by, portWidth, by, darkColor, darkColor);
	
	var xo=4,
	py=by+8;
	for (var i=0; i<ds_list_size(posts); i++) {
		with posts[| i] {
			py+=sprite_yoffset;
			xstart=xo+sprite_xoffset;
			ystart=py;
			py+=sprite_yoffset+4;
		}
	}
	
	draw_surface(childrenObjectSurf, 0, 0);
	
	scrollMinimum=-560;
	
	surface_reset_target();
}