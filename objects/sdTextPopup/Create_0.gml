if live_call() return live_result;

event_inherited();

text="default";
drawScript=function(x, y) {
	if grace>=0 setSwapAmountShader(WHITE_COLOR, WHITE_COLOR, 1, 1);
	draw_set_font(shrimpDefenderFont);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	if life>30 || life%2==0 {
		draw_text(x, y, text);
	}
	shader_reset();
}
life=90;
verticalSpeed=-.2;