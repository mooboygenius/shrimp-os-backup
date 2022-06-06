if live_call() return live_result;

event_inherited();

medalsArray=[];

drawScript=function(mx, my) {
	var w=1, h=1;
	with parentWindow {
		w=portWidth;
		h=portHeight;
	}
	var nx=w div 2, ny=h div 2-60;
	setWaveShader(sprite_width*waveHorizontalMultiplier, sprite_height, waveIntensity, waveIntensity, current_time);
	defaultDrawScript(nx, ny+wave(-1, 1, .5)*3);
	shader_reset();
	
	ny+=sprite_yoffset+8;
	if timer%60<40 && state==3 {
		draw_set_font(fntShrimpcordUsername);
		with mumbaLSMumba {
			if y<(1/2*GAME_HEIGHT) ny+=80;
		}
		drawTextOutlinedGeneral(nx, ny+wave(-1, 1, .5, .1)*2, concat("Press [", getStringFromInput(mumbaInputJump), "]"), 12, 9999, $83EEFF, BLACK_COLOR);
	}
	
	if array_length(medalsArray)>0 {
		var pw=18,
		s=array_length(medalsArray),
		ax=GAME_WIDTH/2+pw/2-(s*pw/2),
		ay=GAME_HEIGHT-12;
		for (var i=0; i<array_length(medalsArray); i++) {
			var in=medalsArray[i][1];
		
			draw_sprite(medalsArray[i][0], in, ax, ay+wave(-1, 1, .8, i*.2)*in);
			ax+=pw;
		}
	}
}

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
	draw_sprite_stretched(sprLevelSelectGradient, 0, 0, 0, surfWidth, surfHeight);
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

sprite_index=generateSprite("aaa");

timer=0;
state=0;
yScale=0;
waveIntensity=1;
waveHorizontalMultiplier=.1;