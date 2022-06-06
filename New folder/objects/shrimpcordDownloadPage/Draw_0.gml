if live_call() return live_result;

// Inherit the parent event
event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	draw_set_font(fntSystem);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text_color(portWidth div 2, portHeight div 2-12, "Chat with your friends\nin a space 100% guaranteed\nsafe for children.", WHITE_COLOR, WHITE_COLOR, WHITE_COLOR, WHITE_COLOR, 1);
	
	with downloadButton {
		xstart=other.portWidth div 2;
		ystart=other.portHeight div 2+24;
	}
	with gotoQAButton {
		font=fntShrimpcordUsername
		xstart=other.portWidth div 2;
		ystart=other.portHeight-17;
	}
	surface_reset_target();
}