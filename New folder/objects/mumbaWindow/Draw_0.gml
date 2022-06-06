if live_call() return live_result;

event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	draw_clear_alpha(BLACK_COLOR, 1);
	
	if surface_exists(childrenObjectSurf) {
		var hot=false;
		with mumbaLevel {
			if reallyHot {
				hot=true;
			}
		}
		if hot {
			var sw=surface_get_width(childrenObjectSurf), sh=surface_get_height(childrenObjectSurf),
			m=10;
			sw*=m;
			sh*=m;
			var int=5.3,
			t=current_time/4;
			setWaveShader(sw, sh, int, int, t);
		}
		
		draw_surface_ext(childrenObjectSurf, childrenSurfaceX, childrenSurfaceY, 1, 1, 0, c_white, 1);
		shader_reset();
	}
	
	if mumbaParticlesOn {
		part_system_position(particleSystem, childrenSurfaceX+cameraX, childrenSurfaceY+cameraY);
		part_system_position(uiParticleSystem, childrenSurfaceX, childrenSurfaceY);
		part_system_drawit(particleSystem);
		part_system_drawit(uiParticleSystem);
	}
	draw_set_font(fntSystem);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	var tc=BLACK_COLOR;
	//draw_text_color(1, 1, concat("instances: ", instance_count, "\nlist size: ", ds_list_size(children)), tc, tc, tc, tc, 1);
	if !mumbaGraphicsOn {
		draw_clear_alpha(BLACK_COLOR, 1);
		draw_set_font(fntMumba);
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_color(c_white);
		draw_text(portWidth div 2, portHeight div 2, "Press F1 to turn on the graphics.");
		if input(vk_f1, PRESS) {
			mumbaGraphicsOn=true;
			updateSetting("mumbaGraphicsOn", mumbaGraphicsOn);
			saveGame();
		}
	}
	
	if drawFPS {
		draw_set_font(fntSmaller);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_text_color(1, 1, concat("fps: ", round(fps)), WHITE_COLOR, WHITE_COLOR, WHITE_COLOR, WHITE_COLOR, 1);
	}
	
	surface_reset_target();
}