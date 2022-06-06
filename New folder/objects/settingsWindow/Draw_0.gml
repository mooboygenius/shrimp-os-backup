if live_call() return live_result;

event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	var bp=gameFrame/2;
	draw_sprite_tiled(sprSettingsBackground, gameFrame/10, bp, bp);
	draw_set_font(fntSystem);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	var c=BLACK_COLOR,
	tx=32,
	ty=10;
	draw_text_transformed_color(tx+random_range(-1, 1), ty+random_range(-1, 1), "Shrettings", wave(.8, 1, 1), 1, 0, c, c, c, c, 1);
	var ys=32;
	for (var i=0; i<array_length(settingButtons); i++) {
		with settingButtons[i] {
			xstart=4+sprite_xoffset;
			ystart=ys;
			ys+=sprite_height+8;
		}
	}
	draw_surface(childrenObjectSurf, 0, 0);
	surface_reset_target();
}