if live_call() return live_result;

event_inherited();

name="";
col=WHITE_COLOR;
outlineCol=BLACK_COLOR;
thick=1;

generateSprite=function(str, color=WHITE_COLOR, outlineColor=BLACK_COLOR, fnt=font, thickness=1) {
	/// @function generateSprite(string, [color], [outlineColor], [font], [thickness])
	draw_set_font(fnt);
	var w=string_width(str), h=string_height(str),
	p=1,
	sw=w+p*2+1, sh=h+p*2+1;
	var surf=surface_create(sw, sh);
	surface_set_target(surf);
	draw_clear_alpha(0, 0);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	drawTextOutlinedGeneral(p, p, str, string_height("\n"), 9999, color, outlineColor, 1, 1, 0, thickness);
	surface_reset_target();
	
	sprite=sprite_create_from_surface(surf, 0, 0, sw, sh, false, false, sw div 2, sh div 2);
	
	surface_free(surf);
	
	return sprite;
}

owner=noone;