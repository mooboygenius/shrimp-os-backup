if live_call() return live_result;

if ds_exists(children, ds_type_list) {
	for (var i=0; i<ds_list_size(children); i++) {
		var inst=children[| i];
		with inst {
			instance_destroy();
		}
	}
}

ds_list_destroy(children);