#macro HOLD 0
#macro PRESS 1
#macro RELEASE 2

function input(key, type=HOLD) {
	var in=false;
	switch key {
		case mb_left:
		case mb_right:
		case mb_middle:
			switch type {
				case HOLD:
					in=mouse_check_button(key);
				break;
				
				case PRESS:
					in=mouse_check_button_pressed(key);
				break;
				
				case RELEASE:
					in=mouse_check_button_released(key);
				break;
			}
		break;
		break;
		break;
		
		default:
			switch type {
				case HOLD:
					in=keyboard_check(key);
				break;
				
				case PRESS:
					in=keyboard_check_pressed(key);
				break;
				
				case RELEASE:
					in=keyboard_check_released(key);
				break;
			}
		break;
	}
	return in;
}

function getMouseX() {
	var mx=mouse_x;
	if os_browser!=browser_not_a_browser {
		mx=(window_mouse_get_x()-window_get_x())/WINDOW_SCALE;
	}
	return mx;
}

function getMouseY() {
	var my=mouse_y;
	if os_browser!=browser_not_a_browser {
		my=(window_mouse_get_y()-window_get_y())/WINDOW_SCALE;
	}
	return my;
}

function setMouseHoveringOver() {
	with cursor hoveringOver=true;
}

function getHighestInstanceAtPosition(x, y) {
	var d=9999,
	lowest=noone,
	list=ds_list_create(),
	instances=instance_position_list(x, y, worldObject, list, false);
	for (var i=0; i<instances; i++) {
		//show_debug_message(concat(i));
		with list[| i] {
			if depth<d && object_index!=cursor {
				d=depth;
				lowest=list[| i];
				//show_debug_message(concat("depth: ", d, ",  i: ", lowest));
			}
		}
	}
	
	/*show_debug_message(concat(
		"-------------\n",
		"lowest depth: ",
		d,
		",  instance: ",
		lowest,
		"   (total instances: ",
		instances,
		")"
	));*/
	
	ds_list_destroy(list);
	
	return lowest;
}

function getHighestInstanceUnderMouse() {
	return getHighestInstanceAtPosition(getMouseX(), getMouseY());
}

function getMouseOverSelf() {
	var in=collision_point(getMouseX(), getMouseY(), self, true, false)>0;
	if in setMouseHoveringOver();
	return in;
}

function getMouseInRectangle(left, top, right, bottom) {
	var in=point_in_rectangle(getMouseX(), getMouseY(), left, top, right, bottom)>0;
	if in setMouseHoveringOver();
	return in;
}