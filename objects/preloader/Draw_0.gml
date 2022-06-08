if live_call() return live_result;
draw_clear_alpha(BLACK_COLOR, 1);
draw_set_color(WHITE_COLOR);
draw_set_font(fntSystem);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
var px=GAME_WIDTH div 2+irandom_range(-1, 1),
py=GAME_HEIGHT div 2+irandom_range(-1, 1);
if gameFrame%60>20 {
	draw_text(px, py, "Click in the playable area\nto start Shrimp-OS.");
}
draw_set_color(c_white);

if input(mb_left, PRESS) {
	instance_create_depth(0, 0, 0, bootup);
	instance_destroy();
	playSound(sfxBaby);
}