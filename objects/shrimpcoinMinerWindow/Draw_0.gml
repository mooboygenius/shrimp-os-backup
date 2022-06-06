if live_call() return live_result;

// Inherit the parent event
event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	
	draw_clear_alpha(darkGreenColor, 1);
	
	var lx1=0, ly=portHeight-24, lx2=portWidth;
	draw_line_color(lx1, ly, lx2, ly, greenColor, greenColor);
	part_system_drawit(minerSystem);
	part_system_position(minerSystem, 0, 48);
	
	draw_surface(childrenObjectSurf, 0, 0);
	var p=8,
	cx=0,
	cy=0;
	with coinButton {
		xstart=sprite_xoffset+p;
		ystart=sprite_yoffset+p;
		cx=xstart;
		cy=ystart-sprite_yoffset+wave(-2, 2, 1);
	}
	draw_set_font(fntShrimppad);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	drawTextOutlinedGeneral(cx, cy, concat(ceil(shrimpCoinsLerp)), 12, 999, greenColor, darkGreenColor, textScale, textScale, 0, 1);
	
	surface_reset_target();
}