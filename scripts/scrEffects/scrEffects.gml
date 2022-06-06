function setSwapAmountShader(color, baseColor, threshold, amount) {
	shader_set(shSwapAmount);
	shader_set_uniform_f(shader_get_uniform(shSwapAmount, "swapColor"), color_get_red(color) / 255, color_get_green(color) / 255, color_get_blue(color) / 255);
	shader_set_uniform_f(shader_get_uniform(shSwapAmount, "swapBaseColor"), color_get_red(baseColor) / 255, color_get_green(baseColor) / 255, color_get_blue(baseColor) / 255);
	shader_set_uniform_f(shader_get_uniform(shSwapAmount, "swapThreshold"), threshold);
	shader_set_uniform_f(shader_get_uniform(shSwapAmount, "swapAmount"), amount);
}

function setWaveShader(textureWidth, textureHeight, horizontalIntensity, verticalIntensity, time) {
	shader_set(shWave);
	shader_set_uniform_f(shader_get_uniform(shWave, "textureWidth"), textureWidth);
	shader_set_uniform_f(shader_get_uniform(shWave, "textureHeight"), textureHeight);
	shader_set_uniform_f(shader_get_uniform(shWave, "waveIntensity"), horizontalIntensity, verticalIntensity);
	shader_set_uniform_f(shader_get_uniform(shWave, "time"), time);
}

function sleep(milliseconds) {
	var gt=current_time+milliseconds;
	while current_time<gt {}
}

function createShrimpy(t) {
	/// @function createShrimpy(text)
	var inst=instance_create_depth(GAME_WIDTH-sprite_xoffset-8, GAME_HEIGHT+sprite_yoffset*2, -1000, shrimpy);
	with inst {
		text=t;
	}
	return inst;
}

function createDownloadWindow(fileObject, n) {
	var d=0;
	with mumbaWindow {
		if depth<d d=depth-10;
	}
	var inst=instance_create_depth(0, 0, d, downloadWindow);
	with inst {
		downloadingFile=fileObject;
		fileName=n;
	}
}

function shakeCamera(amount) {
	with game {
		cameraShake=max(cameraShake, amount);
	}
}