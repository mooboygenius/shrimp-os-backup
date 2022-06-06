if live_call() return live_result;

event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	var dx=portWidth div 2,
	dy=96+scrollYLerp;
	with downloadProgramButton {
		xstart=dx;
		ystart=dy;
	}
	draw_set_font(fntSmaller);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_color(blueColor);
	dy+=16;
	draw_text(dx, dy, "(Current stable build v1.3.54)");
	dy+=32;
	draw_set_font(fntFancy);
	draw_set_halign(fa_left);
	var str="Please consult the \"Help\"\npage for guidance on how\nto use Shrimposer.";
	dx-=string_width(str) div 2;
	draw_text(dx, dy, str);
	draw_set_color(c_white);
	scrollMinimum=-48;
	surface_reset_target();
}