

function addChildrenToParentWindow(list, autoDelete=true) {
	if !instance_exists(parentWindow) {
		show_debug_message(concat(object_get_name(object_index), ": No parent window found."));
		return false;
	}
	for (var i=0; i<ds_list_size(list); i++) {
		if instance_exists(list[| i]) {
			with parentWindow {
				if ds_list_find_index(children, list[| i])<0 {
					ds_list_insert(children, 0, list[| i]);
					//show_debug_message(concat(object_get_name(object_index), ": Added [", i, "] to parent children list"));
				}
			}
		} else if autoDelete {
			ds_list_delete(list, i);
			//show_debug_message(concat(object_get_name(object_index), ": Instance [", i, "] does not exist, deleted."));
		}
	}
	return true;
}