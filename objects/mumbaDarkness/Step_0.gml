if live_call() return live_result;

event_inherited();

drawScript=function(mx, my) {
	if surface_exists(darknessSurface) {
		surface_set_target(darknessSurface);
		draw_clear_alpha(BLACK_COLOR, 1);
		
		gpu_set_blendmode(bm_subtract);
		var sc=.8+wave(0, .02, 2),
		a=gameFrame,
		xo=0,
		yo=0;
		with parentWindow {
			xo=cameraX;
			yo=cameraY;
		}
		with mumbaLivingObject {
			draw_sprite_ext(sprMumbaLightCircle, 0, x+xo, y+yo, sc, sc, a, c_white, 1);
		}
		with mumbaEgg {
			draw_sprite_ext(sprMumbaLightCircle, 0, x+xo, y+yo, sc, sc, a, c_white, 1);
		}
		gpu_set_blendmode(bm_normal);
		
		surface_reset_target();
		
		draw_surface(darknessSurface, 1, 0);
	} else {
		darknessSurface=surface_create(GAME_WIDTH+1, GAME_HEIGHT+1);
	}
}