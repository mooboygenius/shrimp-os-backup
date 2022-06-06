if live_call() return live_result;

event_inherited();

drawScript=function(x, y) {
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(fntShrimpcordUsername);
	
	var left=x-sprite_xoffset, top=y-sprite_yoffset,
	shiftX=13,
	shiftY=2,
	ty=top+shiftY,
	tx=left+shiftX;
	draw_sprite_stretched(sprCrustachanPost, 0, left, top, width, height);
	var greenColor=$4F7D3B;
	draw_text_color(tx, ty, anonymousID, greenColor, greenColor, greenColor, greenColor, 1);
	
	draw_set_color(BLACK_COLOR);
	
	var ix=left+4,
	iy=top+18,
	dx=ix,
	dy=iy;
	if sprite_exists(sprite) {
		var sxo=sprite_get_xoffset(sprite),
		syo=sprite_get_yoffset(sprite);
		ix+=sxo;
		iy+=syo;
		draw_sprite(sprite, 0, ix, iy)
		dx+=sxo*2+6;
		iy+=syo;
	}
	var dsep=12,
	dw=3/4*GAME_WIDTH-dx-8
	draw_text_ext(dx, dy, text, dsep, dw);
	
	var wpad=6;
	width=max(tx-left+string_width(anonymousID)+wpad, dx-left+string_width_ext(text, dsep, dw)+wpad);
	var hpad=6;
	height=max(dy-top+hpad+string_height_ext(text, dsep, dw), iy-top+hpad);
	image_xscale=width/sprite_get_width(sprite_index);
	image_yscale=height/sprite_get_height(sprite_index);
	draw_set_color(c_white);
}