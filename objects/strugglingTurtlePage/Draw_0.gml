if live_call() return live_result;

event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	draw_sprite_tiled(sprStrugglingTurtle, gameFrame/4, 0, 0);
	draw_set_font(fntShrimppad);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(BLACK_COLOR);
	draw_text_ext(4, 18, "WELCOME TO STRUGGLING\nTURTLE", 20, GAME_WIDTH);
	draw_set_font(fntGeorge);
	draw_text_ext(4, 60, "lucy,\n\nevery moment with you i feel like i'm soaring through the stars. you give me the strength to be more than what i thought i was capable of being.\nwill you marry me?\n\njonny", 10, GAME_WIDTH);
	draw_set_color(c_white);
	surface_reset_target();
}