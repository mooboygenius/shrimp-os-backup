if live_call() return live_result;

#region dev keybinds
if DEV_MODE {
	if input(vk_home, PRESS) game_restart();
	if input(vk_delete, PRESS) {
		if show_question("delete save data?") {
			file_delete(SAVE_FILE);
			ds_map_destroy(saveDataMap);
			game_restart();
		}
	}
}
#endregion

if input(vk_f2, PRESS) crtOn=!crtOn;

gameFrame++;

audio_master_gain(masterVolume);

if gameFrame%180==0 || (DEV_MODE && input(vk_f6, PRESS)) {
	adjustGains();
}

if input(vk_f4, PRESS) window_center();

applicationSurfaceX=irandom_range(-applicationSurfaceShake, applicationSurfaceShake);
applicationSurfaceY=irandom_range(-applicationSurfaceShake, applicationSurfaceShake);
applicationSurfaceShake=lerp(applicationSurfaceShake, 0, .2);

waveTime+=10;

//view_camera[0]=camera_create_view(0, 0, GAME_WIDTH, GAME_HEIGHT);
//view_enabled=true;
//view_set_visible(0, true);
//view_set_camera(0, view_camera[0]);
//window_set_size(WINDOW_WIDTH, WINDOW_HEIGHT);
//surface_resize(application_surface, GAME_WIDTH, GAME_HEIGHT);
//display_set_gui_size(WINDOW_WIDTH, WINDOW_HEIGHT);

var l=.25;
cameraZoomLerp=lerp(cameraZoomLerp, cameraZoom, l);
cameraShake=max(cameraShake-.1, 0);
cameraXLerp=lerp(cameraXLerp, cameraX, l)+irandom_range(-cameraShake, cameraShake);
cameraYLerp=lerp(cameraYLerp, cameraY, l)+irandom_range(-cameraShake, cameraShake);

var m=cameraZoomLerp,
cw=GAME_WIDTH*m,
ch=GAME_HEIGHT*m;
camera_set_view_size(view_camera[0], GAME_WIDTH*m, GAME_HEIGHT*m);

var posm=(m-1)/2,
xpos=-cw/2+GAME_WIDTH/2+cameraXLerp,
ypos=-ch/2+GAME_HEIGHT/2+cameraYLerp;
camera_set_view_pos(view_camera[0], xpos, ypos)