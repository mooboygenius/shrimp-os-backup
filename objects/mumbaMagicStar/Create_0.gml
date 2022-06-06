if live_call() return live_result;

event_inherited();

verticalKnockback=-8;

drawScript=function(x, y) {
	if grace>0 {
		setSwapAmountShader(c_white, c_white, 1, 1);
	} else {
		setSwapAmountShader(make_color_hsv(gameFrame%255, 255, 255), c_white, 1, .3);
	}
	defaultDrawScript(x, y);
	shader_reset();
}