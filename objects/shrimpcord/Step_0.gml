if live_call() return live_result;

event_inherited();

if ds_exists(users, ds_type_map) && ds_exists(userList, ds_type_list) && ds_exists(userObjects, ds_type_list) {
	#region TEST
	if input(ord("T"), PRESS) {
		for (var i=0; i<ds_list_size(userObjects); i++) {
			/*var str=concat("[", i, "]: ");
			with userObjects[| i] str+=string(userObjects[| i]);
			show_debug_message(str);*/
		}
	}
	#endregion

	enum shrimpcordStates {friendList}
	switch substate {
		case shrimpcordStates.friendList:
			var o=22,
			yy=12+friendsListScrollLerp,
			size=ds_list_size(userObjects);
			for (var i=0; i<size; i++) {
				with userObjects[| i] {
					xstart=48;
					ystart=lerp(ystart, yy, .3);
				}
				yy+=o;
			}
		
			var in=(mouse_wheel_up()-mouse_wheel_down());
			if getActiveWindow()==id {
				if getMouseX()<portX+96 {
					friendsListScroll+=in*o;
				} else {
					with shrimpcordMessageManager scrollY+=in*o;
				}
			}
			friendsListScroll=clamp(round(friendsListScroll/o)*o, -o*(size-6), 0);
			friendsListScrollLerp=lerp(friendsListScrollLerp, friendsListScroll, .5);
			if in!=0 show_debug_message(friendsListScroll);
		break;
	}
}