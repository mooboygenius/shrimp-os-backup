if live_call() return live_result;

event_inherited();

drawScript=function(x, y) {
	if hoveringOver {
		setSwapAmountShader(c_white, c_white, 1, .25);
	}
	y+=wave(-3, 3, 3)*hoveringOver;
	defaultDrawScript(x, y);
	buttonDrawScript(x, y);
	shader_reset();
}

image_xscale=.1;
image_yscale=image_xscale;