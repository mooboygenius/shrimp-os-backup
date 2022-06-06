if live_call() return live_result;

event_inherited();

angle=round(wave(-1, 1, 2, (x)*.5)*10);

drawScript=function(x, y) {
	var s=mumbaLevelState.incomplete;
	with owner {
		s=status;
	}
	if s<mumbaLevelState.complete {
		shader_set(shGrayscale);
	}
	defaultDrawScript(x, y+z);
	shader_reset();
}