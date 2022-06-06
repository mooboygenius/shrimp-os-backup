if live_call() return live_result;

// Inherit the parent event
event_inherited();

drawScript=function(x, y) {
	var left=x-sprite_xoffset, top=ceil(y-sprite_yoffset);
	draw_sprite_stretched(sprKrillitOutline, 0, left, top, width, height);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(fntSystem);
	var tx=left+24,
	ty=top+4,
	tw=left+width-tx,
	tsep=12,
	tc=postNameColor;
	if postName!="" {
		draw_text_ext_color(tx, ty, postName, tsep, tw, tc, tc, tc, tc, 1);
	}
	var iy=ty+string_height_ext(postName, tsep, tw);
	if sprite_exists(image) {
		draw_sprite(image, 0, tx+sprite_get_xoffset(image), iy+sprite_get_yoffset(image));
		iy+=sprite_get_height(image)+4;
	}
	var dx=tx,
	dy=iy,
	dc=$C2A7A3,
	dw=(width-(tx-left))-8,
	dsep=12;
	draw_set_font(fntShrimpcordUsername);
	draw_text_ext_color(dx, dy, text, dsep, dw, dc, dc, dc, dc, 1);
	var bottom=dy+string_height_ext(text, dsep, dw)+8;
	height=max(32, ceil(bottom-top));
	var vc=$C2A7A3,
	vx=left+12,
	vy=floor(top+height div 2);
	draw_set_font(fntSystem);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text_color(vx, vy, votes, vc, vc, vc, vc, 1);
	image_xscale=width/sprite_get_width(sprite_index);
	image_yscale=height/sprite_get_height(sprite_index);
}