if live_call() return live_result;

if surface_exists(surf) {
	surface_set_target(surf);
	draw_clear_alpha(BLACK_COLOR, 1);
	
	gpu_set_blendmode(bm_subtract);
	draw_circle(GAME_WIDTH div 2, GAME_HEIGHT div 2, circleRadius, false);
	gpu_set_blendmode(bm_normal);
	
	surface_reset_target();
	
	draw_surface(surf, 0, 0);
} else {
	surf=surface_create(GAME_WIDTH, GAME_HEIGHT);
}