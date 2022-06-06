if live_call() return live_result;

for (var i=0; i<ds_list_size(children); i++) {
	with children[| i] instance_destroy();
}

for (var i=0; i<ds_list_size(menuItems); i++) {
	with menuItems[| i] instance_destroy();
}

ds_list_destroy(children);
ds_list_destroy(menuItems);