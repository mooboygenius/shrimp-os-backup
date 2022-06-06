if live_call() return live_result;

event_inherited();

copy+=copySpeed;
if copy>=1 {
	copy=0;
	writtenAmount++;
	written=string_copy(text, 1, writtenAmount);
}

var spr=sprMumbaShopCordeliaBuy;
with mumbaShopController {
	spr=greetingSprite;
}

drawScript=function(x, y) {
	var m=.2,
	int=.004;
	setWaveShader(sprite_width*m, sprite_height*m, int, int, (gameFrame div 10)*100)
	defaultDrawScript(drawX, drawY);
	shader_reset();
	var txo=16,
	tx=drawX+txo,
	ty=drawY-sprite_height+12,
	sep=12,
	tw=180,
	c=BLACK_COLOR;
	draw_set_font(mumbaShopFont);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_ext_transformed_color(tx, ty, written, sep, tw, 1, 1, 0, c, c, c, c, 1);
	var h=sprite_get_height(sprite_index),
	w=sprite_get_width(sprite_index),
	sh=string_height_ext(text, sep, tw)+24,
	sw=string_width_ext(text, sep, tw)+txo*2;
	image_xscale=lerp(image_xscale, max(w, sw)/w, .5);
	image_yscale=lerp(image_yscale, max(h, sh)/h, .5);
}

with mumbaShopkeeper {
	other.targetX=ceil(targetX+sprite_get_xoffset(spr)*.65);
	other.targetY=max(52, targetY-sprite_yoffset*.66-myWave+wave(-1, 1, 2, .2))+wave(-1, 1, 3)*3;
}

with mumbaShopController {
	other.targetX+=bubbleXOffset;
}