if live_call() return live_result;

// Inherit the parent event
event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	draw_clear_alpha(WHITE_COLOR, 1);
	
	var sideBarWidth=64,
	sideBarLeft=portWidth-sideBarWidth,
	sideBarTop=scrollYLerp,
	sideBarHeight=portHeight-sideBarTop;
	draw_sprite_stretched(sprKrillitOutline, 0, sideBarLeft, sideBarTop, sideBarWidth+1, sideBarHeight+1);
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(fntShrimpcordUsername);
	var stx=sideBarLeft+4,
	sty=sideBarTop+44;
	draw_text_ext_color(stx, sty, concat("THE WORST SHRIMPSITE ON THE PLANET\n\n", onlineUsers, "000 users online\n\n", extraText), 11, sideBarWidth-4, orangeColor, orangeColor, orangeColor, orangeColor, 1);
	
	var bx=0,
	by=9+scrollYLerp,
	bw=portWidth,
	bh=32;
	draw_sprite_stretched(sprKrillitBanner, 0, bx, by, bw, bh);
	
	with logo {
		xstart=sprite_xoffset+6;
		ystart=by+13;
	}
	
	draw_sprite(sprKrillitMail, 0, portWidth-16, by+12);
	
	draw_surface(childrenObjectSurf, 0, 0);
	
	surface_reset_target();
	
	scrollMinimum=-64;
}