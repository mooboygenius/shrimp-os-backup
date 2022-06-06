if live_call() return live_result;

drawX=0;
drawY=0;

horizontalSpeed=0;
verticalSpeed=0;

event_inherited();

generateSprite=function(text) {
	/// @function generateSprite(text)
	draw_set_font(mumbaLevelFont);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	var pad=2,
	surfWidth=string_width(text),
	surfHeight=string_height(text),
	surf1=surface_create(surfWidth, surfHeight);
	
	// draw text, layer effect on top of text
	surface_set_target(surf1);
	draw_clear_alpha(0, 0);
	draw_text(0, 0, text);
	
	gpu_set_colorwriteenable(true, true, true, false);
	//draw_sprite_stretched(sprLevelSelectGradient, 0, 0, 0, surfWidth, surfHeight);
	gpu_set_colorwriteenable(true, true, true, true);
	
	surface_reset_target();
	
	// draw outline around surf
	var surf2Width=surfWidth+pad*2,
	surf2Height=surfHeight+pad*2,
	surf2=surface_create(surfWidth+pad*2, surfHeight+pad*2);
	
	surface_set_target(surf2);
	draw_clear_alpha(0, 0);
	
	setSwapAmountShader(BLACK_COLOR, c_white, 1, 1);
	draw_surface(surf1, pad+pad, pad);
	draw_surface(surf1, pad-pad, pad);
	draw_surface(surf1, pad, pad+pad);
	draw_surface(surf1, pad, pad-pad);
	shader_reset();
	draw_surface(surf1, pad, pad);
	
	surface_reset_target();
	
	sprite=sprite_create_from_surface(surf2, 0, 0, surf2Width, surf2Height, false, false, surf2Width/2, surf2Height/2);
	
	surface_free(surf1);
	surface_free(surf2);
	
	return sprite;
}

drawScript=function(x, y) {
	defaultDrawScript(drawX, drawY+wave(-1, 1, 2)*3);
}

sprite_index=generateSprite("aaa");