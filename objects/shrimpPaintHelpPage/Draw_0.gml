if live_call() return live_result;

event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	draw_set_font(fntShrimppad);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	var pinkColor=$7752FF;
	draw_set_color(pinkColor);
	
	var ty=48+scrollYLerp,
	tx=4;
	draw_text_ext(tx+random_range(-1, 1), ty+random_range(-1, 1), "SO YOU THINK YOU HAVE\nWHAT IT TAKES TO BE AN\nARTIST, DIPSHIT????????????????????????", 16, 999);
	ty+=64;
	draw_set_font(fntSystem);
	draw_text_ext(tx, ty, "Worry not! Shrimp Paint is a VERY user-friendly piece of shrimpware designed specifically with beginner artists in mind.\n\nTo get started, go to the DOWNLOAD page and DOWNLOAD Shrimp Paint.\n\nOnce you have DOWNLOADED Shrimp Paint, you will be able to create new Shrimp Paint files by right clicking on your shrimptop, selecting \"Make new thing\", and then selecting \"Pretty Picture\".\n\nFrom there, it's smooth sailing. Name the new Shrimp Paint file whatever you want and open it up!\n\nSelect a color from the left and change your brush size with the scroll wheel.\n\nNow get drawing!\n\n\n\n\n\n\n\n\n\n\n\ngorge bush", 12, GAME_WIDTH-20);
	
	scrollMinimum=-350;
	
	draw_set_color(c_white);
	surface_reset_target();
}