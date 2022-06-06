if live_call() return live_result;

event_inherited();

drawScript=function(x, y) {
	defaultDrawScript(x, y);
	var left=x-sprite_xoffset,
	top=y-sprite_yoffset;
	var pfpPad=12,
	pfpX=left+pfpPad,
	pfpY=top+pfpPad;
	draw_sprite(profileSprite, 0, pfpX, pfpY);
	var nameColor=$734940;
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	draw_set_font(fntShrimpcordUsername);
	var nameX=pfpX+12,
	nameY=pfpY;
	draw_text_color(nameX, nameY, name, nameColor, nameColor, nameColor, nameColor, 1);
	draw_set_font(fntSystem);
	draw_set_valign(fa_top);
	var textY=nameY+8,
	textX=nameX,
	textW=sprite_width-28,
	textSep=11;
	var tc=BLACK_COLOR;
	draw_text_ext_color(textX, textY, text, textSep, textW, tc, tc, tc, tc, 1);
	textY+=string_height_ext(text, textSep, textW);
	image_yscale=(textY-top+20)/sprite_get_height(sprite_index);
}