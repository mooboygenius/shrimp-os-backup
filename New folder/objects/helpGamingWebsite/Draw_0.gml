if live_call() return live_result;

event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	
	draw_clear_alpha(WHITE_COLOR, 1);
	draw_sprite_tiled(sprHelpGamingBackground, 0, 0, 0);
	
	var dx=portWidth div 2,
	dy=portHeight div 2;
	
	draw_sprite(sprHelpGamingVideo, videoIndex, dx, dy);
	
	surface_reset_target();
}