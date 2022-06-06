if live_call() return live_result;

event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	var sx=portWidth div 2+random_range(-shrimpShake, shrimpShake),
	sy=portHeight div 2-20+random_range(-shrimpShake, shrimpShake);
	draw_sprite_ext(sprShrimpcordLoader, 0, sx, sy, 2, 2, round(shrimpAngle), c_white, 1);
	draw_set_font(fntShrimpcordLoader);
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	var t=shrimpText,
	tx=portWidth div 2-string_width("LOADING...") div 2,
	ty=portHeight-32+wave(-2, 2, 1);
	draw_text(tx, ty, t);
	var flagY=portHeight-20,
	flagX=portWidth div 2+string_width("LOADING...") div 2;
	draw_sprite(sprShrimpFlag, 0, flagX, flagY);
	var shrimpX=lerp(tx, flagX-sprite_get_width(sprShrimpFlag), timer/goalTime);
	draw_sprite(sprLittleChaserShrimp, shrimpFrame, shrimpX, flagY);
	//
	surface_reset_target();
}