if live_call() return live_result;

if ds_exists(dots, ds_type_list) {
	for (var i=0; i<ds_list_size(dots); i++) {
		for (var q=0; q<ds_list_size(dots[| i]); q++) {
			var inst=dots[| i][| q];
			with inst {
				instance_destroy();
			}
		}
	}
}

with decor {
	instance_destroy();
}