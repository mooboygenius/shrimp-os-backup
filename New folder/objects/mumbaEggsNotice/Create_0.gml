if live_call() return live_result;

event_inherited();

generateSprite=function() {
	draw_set_font(fntSystem);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	var startString=choose("NAB ", "COLLECT ", "GRAB ", "GET ", "OBTAIN "),
	numberString=0;
	with mumbaRealLevel {
		numberString=eggGoal;
	}
	var endString=" EGGS!",
	fullString=concat(startString, numberString, endString);
	
	var t=1,
	sw=string_width(fullString)+t*2,
	sh=string_height(fullString)+t*2,
	surf=surface_create(sw, sh);
	surface_set_target(surf);
	draw_clear_alpha(0, 0);
	
	var tx=t;
	drawTextOutlinedGeneral(tx, t, fullString, 10, 9999, c_white, BLACK_COLOR, 1, 1, 0, 1);
	
	tx+=string_width(startString);
	drawTextOutlinedGeneral(tx, t, concat(numberString), 10, 9999, $83EEFF, BLACK_COLOR, 1, 1, 0, 1);
	surface_reset_target();
	
	sprite=sprite_create_from_surface(surf, 0, 0, sw, sh, false, false, sw/2, sh/2);

	surface_free(surf);
	
	return sprite;
}

sprite_index=generateSprite();

drawScript=function(x, y) {
	if show {
		defaultDrawScript(drawX, drawY);
	}
}