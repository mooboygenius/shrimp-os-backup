if live_call() return live_result;

event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	draw_sprite_tiled(sprFireShrimpHomeBackground, 0, 0, 0);
	
	var lx=portWidth div 2,
	t=4,
	ly=28+wave(-2, 2, t/2),
	lxs=wave(-1, 1, t);
	draw_sprite_ext(sprFireShrimpTitle, 0, lx, ly, lxs, 1, 0, c_white, 1);

	var sx=portWidth-16,
	sy=portHeight-10,
	m=15,
	a=20,
	sang=round(wave(-a, a, 1)/m)*m;
	draw_sprite_ext(sprClipartShrimp, 0, sx, sy, 1, 1, sang, c_white, 1);
	
	draw_set_font(fntShrimpcordUsername);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	var c=BLACK_COLOR,
	tx=portWidth div 2,
	ty=50;
	draw_text_transformed_color(tx, ty, "HERE'S SOME COOL SHRIMPSITES:", 1, 1, wave(-3, 3, 1), c, c, c, c, 1);
	
	draw_surface(childrenObjectSurf, 0, 0);
	surface_reset_target();
}