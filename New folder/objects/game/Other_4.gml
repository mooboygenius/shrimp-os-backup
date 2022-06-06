if live_call() return live_result;

view_camera[0]=camera_create_view(0, 0, GAME_WIDTH, GAME_HEIGHT);
view_enabled=true;
view_set_visible(0, true);
view_set_camera(0, view_camera[0]);
surface_resize(application_surface, GAME_WIDTH, GAME_HEIGHT);
display_set_gui_size(WINDOW_WIDTH, WINDOW_HEIGHT);