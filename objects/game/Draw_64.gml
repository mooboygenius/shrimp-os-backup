if live_call() return live_result;

if surface_exists(passSurf1) {
	surface_set_target(passSurf1);
	var sc=WINDOW_SCALE;
	if os_browser==browser_not_a_browser {
		sc=WINDOW_SCALE;
	}
	
	
	setWaveShader(waveTextureWidth*waveTextureWidthMultiplier, waveTextureHeight*waveTextureHeightMultiplier, waveHorizontalIntensity, waveVerticalIntensity, waveTime);
	
	draw_surface_ext(application_surface, applicationSurfaceX, applicationSurfaceY, 1, 1, 0, c_white, 1);
	
	shader_reset();
	
	surface_reset_target();
	
	draw_surface_ext(passSurf1, 0, 0, sc, sc, 0, c_white, 1);
} else {
	passSurf1=surface_create(GAME_WIDTH, GAME_HEIGHT);
}