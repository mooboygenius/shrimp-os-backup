if live_call() return live_result;

for (var i=0; i<ds_list_size(children); i++) {
	with children[| i] instance_destroy();
}

ds_list_destroy(children);

with parentWindow childrenSurfaceY=0;