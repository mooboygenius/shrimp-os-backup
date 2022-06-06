if live_call() return live_result;

if surface_exists(windowSurface) {
	if grace>0 setSwapAmountShader(c_white, c_white, 1, 1);
	surface_set_target(windowSurface);
	draw_clear_alpha(0, 0);
	draw_set_font(fntSystem);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);

	var tx=windowPadWidth,
	ty=windowPadHeight;
	draw_sprite_stretched(sprRightClickMenu, 0, 0, 0, windowWidth, windowHeight*appeared);
	for (var i=0; i<array_length(options); i++) {
		var txt=options[i][optionData.label],
		selected=options[i][optionData.selected];
		var left=x,
		top=y+ty,
		right=x+windowWidth,
		bottom=y+ty+lineBreakHeight-1;
		var c1=c_orange,
		c2=c_red;
		if selected {
			c1=c_aqua;
			c2=c_blue;
		}
		
		while bottom>room_height {
			bottom--;
			y--;
		}
		
		while top<0 {
			top++;
			y++;
		}
		
		while right>room_width {
			right--;
			x--;
		}
		
		while left<0 {
			left++;
			x++;
		}
	
		//draw_rectangle_color(left, top, right, bottom, c1, c1, c2, c2, false);
	
		var spr=sprRightClickMenuSelection,
		in=selected;
		if selected mouseIsInMenu=true;
		draw_sprite_stretched(spr, in, 0, ty, windowWidth, lineBreakHeight*appeared);
	
		selected=getMouseInRectangle(left, top, right, bottom);
		var col=selected ? c_white : BLACK_COLOR;
		draw_text_transformed_color(tx, ty, txt, 1, appeared, 0, col, col, col, col, 1);
		options[i][optionData.selected]=selected;
		options[i][optionData.effect]=lerp(options[i][optionData.effect], selected, .5);
		
		if selected && input(mb_left, RELEASE) {
			var func=options[i][optionData.funct];
			func();
		}
		
		ty+=lineBreakHeight*appeared;
	}

	shader_reset();
	surface_reset_target();
	
	var pad=8, sw=windowWidth+pad, sh=windowHeight+pad;
	if surface_exists(passSurface1) {
		surface_set_target(passSurface1);
		draw_clear_alpha(0, 0);
		draw_surface(windowSurface, pad div 2, pad div 2);
		shader_reset();
		surface_reset_target();
		
		if surface_exists(passSurface2) {
			surface_set_target(passSurface2);
			draw_clear_alpha(c_red, 0);
			setWaveShader(sw, sh, waveIntensity, 0 , current_time);
			draw_surface(passSurface1, 0, 0);
			shader_reset();
			surface_reset_target();
			
			if surface_exists(passSurface3) {
				surface_set_target(passSurface3);
				draw_clear_alpha(0, 0);
				draw_surface(passSurface2, 0, 0);
				gpu_set_blendmode(bm_subtract);
				draw_sprite_tiled(sprDither, ditherIndex, 0, 0);
				gpu_set_blendmode(bm_normal);
				surface_reset_target();
				draw_surface(passSurface3, x-pad div 2, y-pad div 2);
			} else {
				passSurface3=surface_create(sw, sh);
			}
		} else {
			passSurface2=surface_create(sw, sh);
		}
	} else {
		passSurface1=surface_create(sw, sh);
	}
} else {
	windowSurface=surface_create(windowWidth, windowHeight);
}