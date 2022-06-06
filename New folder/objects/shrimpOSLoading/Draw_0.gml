if live_call() return live_result;

if doDraw {
	var lx=GAME_WIDTH div 2,
	ly=GAME_HEIGHT div 2-30;
	draw_sprite_ext(sprShrimpOSBootLogo, 0, lx, ly, (wave(-1, 1, 2)*20 div 4)/3, .9, 0, c_white, 1);
	draw_set_font(fntShrimpcordLoader);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);

	var tx=lx,
	ty=GAME_HEIGHT-48;
	draw_text(tx, ty+wave(-2, 2, 1), concat("SHRIMP-OS Loading...", round(max(0, percentLoaded)), "%"));

	var n=8,
	o=sprite_get_width(sprShrimpOSLoadBlock)+4,
	sx=GAME_WIDTH div 2-(o*(n/2)),
	sy=GAME_HEIGHT-28;
	for (var i=0; i<n; i++) {
		var me=i+1,
		img=0;
		if floor(loadBlock)%n==i img=1;
		draw_sprite(sprShrimpOSLoadBlock, img, sx, sy);
		sx+=o;
	}
}