if live_call() return live_result;
if hasButtons {
	for (var i=0; i<array_length(butt); i++) {
		instance_destroy(butt[i]);
	}
}
for (var i=0; i<ds_list_size(children); i++) {
	instance_destroy(children[| i]);
}
ds_list_destroy(children);

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	draw_clear_alpha(0, 0);
	surface_reset_target();
	surface_free(finalSurf);
}
if surface_exists(storeFinalSurf) {
	surface_set_target(storeFinalSurf);
	draw_clear_alpha(0, 0);
	surface_reset_target();
	surface_free(storeFinalSurf);
}

if surface_exists(childrenObjectSurf) {
	surface_set_target(childrenObjectSurf);
	draw_clear_alpha(0, 0);
	surface_reset_target();
	surface_free(childrenObjectSurf);
}
if surface_exists(backgroundSurface) {
	surface_set_target(backgroundSurface);
	draw_clear_alpha(0, 0);
	surface_reset_target();
	surface_free(backgroundSurface);
}