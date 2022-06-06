if live_call() return live_result;

if surface_exists(passSurf1) {
	surface_set_target(passSurf1);
	
	draw_clear_alpha(0, 0);
	
	var cx=GAME_WIDTH div 2,
	cy=GAME_HEIGHT div 2;
	with sdObject {
		if hasShadow {
			var l=.6,
			sx=lerp(x, cx, l),
			sy=lerp(y, cy, l);
			drawScript(sx, sy, .5);
		}
	}
	
	surface_reset_target();
	
	if surface_exists(passSurf2) {
		surface_set_target(passSurf2);
		draw_clear_alpha(0, 0);
		var m=.25,
		tw=GAME_WIDTH*m,
		th=GAME_HEIGHT*m,
		int=.2,
		hint=int,
		vint=int;
		
		setWaveShader(tw, th, hint, vint, gameFrame);
		draw_surface(passSurf1, 0, 0);
		shader_reset();
		surface_reset_target();
		
		if surface_exists(passSurf3) {
			surface_set_target(passSurf3);
			draw_clear_alpha(0, 0);
			draw_surface(passSurf2, 0, 0);
			
			gpu_set_blendmode(bm_subtract);
			draw_sprite_tiled(sprDither, 3, 0, 0);
			gpu_set_blendmode(bm_normal);
			
			surface_reset_target();
			
			setSwapAmountShader($4d352c, WHITE_COLOR, 1, 1);
			draw_surface(passSurf3, 0, 0);
			shader_reset();
		} else {
			passSurf3=surface_create(GAME_WIDTH, GAME_HEIGHT);
		}
		
	} else {
		passSurf2=surface_create(GAME_WIDTH, GAME_HEIGHT);
	}
	
} else {
	passSurf1=surface_create(GAME_WIDTH, GAME_HEIGHT);
}