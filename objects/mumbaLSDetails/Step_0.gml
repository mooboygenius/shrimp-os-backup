if live_call() return live_result;

event_inherited();

with mumbaWindow {
	other.xstart=-cameraX+16;
	other.ystart=-cameraY+4;
}

if DEV_MODE && input(vk_f1, PRESS) {
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
	waveIntensity=1;
	waveHorizontalMultiplier=.1;
	yScale=0;
	timer=0;
	state=0;
	sprite_index=generateSprite(choose("test", "balls", "titties", "ass man", "better call saul"));
}

enum levelSelectDetailStates {
	start=0,
	destroy=4
}

switch state {
	case 0:
		timer++;
		if timer>5 {
			timer=0;
			state=1;
		}
	break;
	
	case 1:
		var t=1.5;
		yScale=lerp(yScale, t, .4);
		if yScale>t-.05 {
			state=2;
		}
	break;
	
	case 2:
		var t=.8;
		yScale=lerp(yScale, t, .4);
		if yScale<t+.05 {
			state=3;
		}
	break;
	
	case 3:
		yScale=lerp(yScale, 1, .3);
		timer++;
		if input(vk_delete, PRESS) && DEV_MODE {
			timer=0;
			state=4;
		}
	break;
	
	case 4:
		var t=1.5;
		yScale=lerp(yScale, t, .2);
		if yScale>t-.05 {
			state=5;
		}
	break;
	
	case 5:
		var t=0;
		yScale=lerp(yScale, t, .4);
		if yScale<t+.05 {
			instance_destroy();
		}
	break;
}

xScale=1+(1-yScale);
angle=round(wave(-1, 1, 1)*3);
if state>0 {
	var l=.1;
	waveHorizontalMultiplier=lerp(waveHorizontalMultiplier, 1, l);
	waveIntensity=lerp(waveIntensity, 0, l);
}

while sprite_width>GAME_WIDTH-40 {
	image_xscale-=.01;
}