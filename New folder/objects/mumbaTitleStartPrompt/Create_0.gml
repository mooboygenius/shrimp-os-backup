if live_call() return live_result;

event_inherited();

drawScript=function(x, y) {
	draw_set_font(fntBoot);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	var t=40;
	if (timer%t)<(t/2) {
		drawTextOutlinedGeneral(drawX, drawY, "PRESS ANY BUTTON", 12, GAME_WIDTH, WHITE_COLOR, BLACK_COLOR, 1, 1, 0, 1);
	}
}