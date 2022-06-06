if live_call() return live_result;

if surface_exists(passSurf1) {
	surface_set_target(passSurf1);
	draw_clear_alpha(0, 0);
	with worldObject {
		if hasShadow && visible {
			var dx=x, dy=y;
			if object_is_ancestor(object_index, window) {
				dx=border[borders.left][0]+(windowWidth-windowWidth*windowScale)/2;
				dy=border[borders.top][0]+(windowHeight-windowHeight*windowScale)/2;
			}
			drawShadowScript(dx, dy);
		}
	}
	surface_reset_target();
	
	if surface_exists(passSurf2) {
		surface_set_target(passSurf2);
		draw_clear_alpha(0, 0);
		setSwapAmountShader(BLACK_COLOR, c_white, 1, 1);
		draw_surface(passSurf1, 0, 0);
		gpu_set_blendmode(bm_subtract);
		draw_sprite_tiled(sprDither, 2, 0, 0);
		gpu_set_blendmode(bm_normal);
		surface_reset_target();
		
		var o=2;
		setSwapAmountShader(BLACK_COLOR, c_white, 1, 1);
		draw_surface(passSurf1, o, o);
		o+=2;
		draw_surface(passSurf2, o, o);
		shader_reset();
	} else {
		passSurf2=surface_create(GAME_WIDTH, GAME_HEIGHT);
	}
} else {
	passSurf1=surface_create(GAME_WIDTH, GAME_HEIGHT);
}