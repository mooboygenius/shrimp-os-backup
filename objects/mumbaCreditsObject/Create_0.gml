if live_call() return live_result;

event_inherited();

sprite=noone;

generateSprite=function(str) {
	/// @function generateSprite(string)
	draw_set_font(fntMumba);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	var w=string_width(str), h=string_height(str),
	p=1,
	sw=w+p*2+1, sh=h+p*2+1;
	var surf=surface_create(sw, sh);
	surface_set_target(surf);
	draw_clear_alpha(0, 0);

	drawTextOutlinedGeneral(floor(sw div 2), p, str, string_height("\n"), 9999, c_white, BLACK_COLOR, 1, 1, 0, 1);
	surface_reset_target();
	
	sprite=sprite_create_from_surface(surf, 0, 0, sw, sh, false, false, sw div 2, sh div 2);
	
	sprite_set_bbox(sprite, 0, 0, sw, sh);
	
	mask_index=sprite;
	
	surface_free(surf);
	
	return sprite;
}

life=120;
drawScript=function(x, y) {
	if life>60 || life%3==0 {
		defaultDrawScript(x, y);
	}
}

snapped=true;