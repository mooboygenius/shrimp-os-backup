if live_call() return live_result;

event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	draw_clear_alpha(c_white, 1);
	draw_sprite_tiled(sprjerrbg,0,scrollx,scrolly);
	draw_sprite_ext(sprJerrtitle,0,0,0,random_range(0.99,1.01),random_range(0.99,1.01),random_range(-0.5,0),-1,1);
	draw_sprite_ext(sprJerrplace,0,70,24,random_range(0.99,1.01),random_range(0.99,1.01),random_range(-0.5,0),-1,1);
	draw_sprite_ext(sprGuruhold,0,103,70,random_range(0.99,1.01),random_range(0.99,1.01),random_range(-1,1),-1,1);
	
	
	if(holding){
		draw_sprite(sprjerrspin,current_time*0.02,0,0);
	}
	
	draw_sprite_ext(sprJerrmandala,0,21,70,mandalascale,mandalascale,current_time*0.05,-1,1);
	
	draw_surface(childrenObjectSurf, 0, 0)
	surface_reset_target();
}
