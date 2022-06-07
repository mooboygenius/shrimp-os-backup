if live_call() return live_result;

event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	draw_clear_alpha(c_white, 1);
	
	if(!flipping){
		draw_sprite_ext(booksprite,pageindex,0,0,1,1,0,-1,1);
		draw_sprite_ext(booksprite,pageindex+1,96,0,1,1,0,-1,1);
	}else{
		if(flippingr){
			draw_sprite_ext(booksprite,pagern,96,0,1,1,0,-1,1);
			draw_sprite_ext(booksprite,pagel,0,0,1,1,0,-1,1);
			if(!halfway){
				draw_sprite_ext(booksprite,pager,96,0,pagescale,1,0,-1,1);
			}else{
				draw_sprite_ext(booksprite,pageln,96-96*pagescale,0,pagescale,1,0,-1,1);
			}
		}else{
			draw_sprite_ext(booksprite,pageln,0,0,1,1,0,-1,1);
			draw_sprite_ext(booksprite,pager,96,0,1,1,0,-1,1);
			if(!halfway){
				draw_sprite_ext(booksprite,pagel,96-96*pagescale,0,pagescale,1,0,-1,1);
			}else{
				draw_sprite_ext(booksprite,pagern,96,0,pagescale,1,0,-1,1);
			}
		}
	}
	
	draw_surface(childrenObjectSurf, 0, 0)
	surface_reset_target();
}
