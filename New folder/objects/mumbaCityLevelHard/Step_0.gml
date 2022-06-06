if live_call() return live_result;

event_inherited();

generateClouds(300, mumbaSnowCloud);

if input(vk_f1, PRESS) {
	with mumbaWall instance_destroy();
	for (var i=0; i<ds_list_size(children); i++) {
		with children[| i] {
			if object_index!=mumbaPlayer {
				instance_destroy();
			}
		}
	}
	surface_free(tileSurface);
	
	event_perform(ev_create, 0);
}