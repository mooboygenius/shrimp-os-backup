if live_call() return live_result;

event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	draw_clear_alpha(WHITE_COLOR, 1);
	
	var scy=scrollYLerp;
	draw_sprite_stretched(sprNotepad, 0, 0, scy, portWidth, portHeight-scrollY);
	var t=text,
	c=BLACK_COLOR,
	lightColor=$C2A7A3,
	tx=14,
	ty=scy+22;
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(fntShrimppad);
	draw_text_color(tx, scy, "Shrimppad v1.0", lightColor, lightColor, lightColor, lightColor, 1);
	if t=="" {
		t="write about shrimp...\nfrom your computer...";
		var time=1000;
		if current_time%time<(time/4) t="";
		c=lightColor;
		ty+=wave(0, -2, 1);
	} else {
		var time=600;
		if current_time%time<(time/2) t+="_";
	}
	draw_set_font(fntSystem);
	draw_text_ext_color(tx, ty, t, 11, portWidth-tx, c, c, c, c, 1);
	surface_reset_target();
}