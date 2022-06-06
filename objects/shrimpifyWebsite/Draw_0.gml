if live_call() return live_result;

event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	draw_clear_alpha(BLACK_COLOR, 1);
	draw_sprite(sprShrimpifySiteLogo, 0, 70, 28);
	draw_set_font(fntMumbaShop);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text_color(portWidth div 2, portHeight div 2-6+wave(-2, 2, 2), "Your music,\nwhen you want it.", WHITE_COLOR, WHITE_COLOR, WHITE_COLOR, WHITE_COLOR, 1);
	with downloadButton {
		lockSize=true;
		image_xscale=4;
		image_yscale=1.1
		xstart=other.portWidth div 2;
		ystart=other.portHeight div 2+40;
	}
	draw_surface(childrenObjectSurf, 0, 0);
	surface_reset_target();
}