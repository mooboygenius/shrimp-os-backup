if live_call() return live_result;

if showText {
	draw_set_font(fntBoot);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_color(4, 4, text, WHITE_COLOR, WHITE_COLOR, WHITE_COLOR, WHITE_COLOR, 1);
}

var rc=$734940;
draw_rectangle_color(0, 0, GAME_WIDTH, wipeHeight, rc, rc, rc, rc, false);