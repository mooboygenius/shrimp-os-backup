if live_call() return live_result;

// Inherit the parent event
event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	draw_sprite_tiled(sprBimsyPageBackground, 0, 0, 12+scrollYLerp);
	
	var tx=92, ty=40+scrollYLerp;
	draw_sprite(sprBimsyPageLogo, 0, tx, ty);
	
	var a=[sprBimsyPageSc1, sprBimsyPageSc2, sprBimsyPageSc3];
	var ix=GAME_WIDTH-60,
	iy=20+scrollYLerp;
	for (var i=0; i<3; i++) {
		iy+=sprite_get_yoffset(a[i]);
		draw_sprite(a[i], 0, ix, iy);
		iy+=sprite_get_yoffset(a[i])+24;
	}
	
	draw_set_color(BLACK_COLOR);
	var dx=4, dy=ty+28,
	dsep=14,
	dw=200,
	dt="Ladies and gents, boisengirls, the long awaited BIMSYMART ShrimpOS port has finally been released! But why should you download this super cool, action packed, high octane, super insane out-of-this-world gaming experience!?!?!?\n\nHere's what you're missing out on, buster:\n* 5 gripping stages!!\n* 24 excellent microgames!!!\n* Mind boggling voice acting!\n* Unlockables!!!!\n* Bonus music!!!!!\n* Extra gameplay modifiers!!!!!!!\n\nWell shucks! If you're not downloading this right away, you're probably going to hell!!!!";
	draw_set_font(fnt404);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_ext(dx, dy, dt, dsep, dw);
	
	dy+=string_height_ext(dt, dsep, dw)+32;
	
	with downloadButton {
		xstart=100;
		ystart=dy;
	}
	
	dy+=40;
	
	var dt="!!! Note: the game is played using the Arrow keys and the Z key. Make sure your computer has those before you download the game. !!!\n\nHere's what a critic had to say about this:\n\n\"My wife once handed me a red banana and said 'RED BANANA' and I thought it was the best thing I've ever seen. It made me laugh so much. That was of course, until... I played 'name of game'! WOWEE! I COULDN'T BELIEVE IT! 10/10 MY LIFE IS BETTER NOW\" -Plufmot\n\nAmen!"
	draw_text_ext(dx, dy, dt, dsep, dw);
	
	draw_surface(childrenObjectSurf, 0, 0);
	
	draw_set_color(c_white);
	
	surface_reset_target();
}

scrollMinimum=-540;