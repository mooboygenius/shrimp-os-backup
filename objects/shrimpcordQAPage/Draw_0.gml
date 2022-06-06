if live_call() return live_result;

// Inherit the parent event
event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	draw_set_font(fntSystem);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_text_color(portWidth div 2, portHeight div 2-28, "Account hijacking Q&A\n5/18/99\n\nQ. What will you do to address\nthe account hijacking issue?\n\nA. lol", WHITE_COLOR, WHITE_COLOR, WHITE_COLOR, WHITE_COLOR, 1);
	
	with gotoDownloadButton {
		xstart=other.portWidth div 2;
		ystart=other.portHeight-8;
	}
	surface_reset_target();
}