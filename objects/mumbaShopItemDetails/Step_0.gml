if live_call() return live_result;

event_inherited();

drawScript=function(x, y) {
	if grace>0 setSwapAmountShader(c_white, c_white, 1, 1);
	
	draw_set_font(fntMumbaShop);
	draw_set_color(WHITE_COLOR);
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	
	var nx=drawX, yy=drawY;
	drawTextOutlinedGeneral(nx, yy+wave(-1, 1, .5, .1), name, 12, 80, WHITE_COLOR, BLACK_COLOR, 1, 1, 0);
	
	if sprite_exists(sprite) {
		var sx=nx,
		syo=sprite_get_yoffset(sprite),
		sy=yy+syo,
		sa=round(wave(-1, 1, 1.5)*8);
		draw_sprite_ext(sprite, 0, sx, sy, 1, 1, sa, c_white, 1);
		yy+=sprite_get_height(sprite)-4;
	}
	
	draw_set_font(fntShrimpcordUsername);
	draw_set_valign(fa_top);
	var dx=nx;
	drawTextOutlinedGeneral(dx, yy+wave(-1, 1, .5, .3), description, 10, 100)
	
	shader_reset();
}

targetX=145;
targetY=70;