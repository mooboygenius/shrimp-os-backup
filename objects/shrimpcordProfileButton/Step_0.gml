if live_call() return live_result;

event_inherited();

switch substate {
	case 0:
		// nothing
	break;
	
	case 1:
		image_index=1;
	break;
}

hoverEffect=lerp(hoverEffect, hoveringOver, .5);

draw_set_font(fntShrimpcordUsername);
var w=sprite_width-24;
while string_width(name)>w {
	if !string_pos("...", name) name+="...";
	var l=string_length(name)-3;
	name=string_delete(name, l, 1);
}

draw_set_font(fntSmaller);
while string_width(description)>w {
	if !string_pos("...", description) description+="...";
	var l=string_length(description)-3;
	description=string_delete(description, l, 1);
}

if moveToTop {
	var inst=id;
	with parentWindow {
		for (var i=0; i<ds_list_size(userObjects); i++) {
			if userObjects[| i]==inst {
				show_debug_message("found");
				ds_list_delete(userObjects, i);
			}
		}
		ds_list_insert(userObjects, 0, inst);
		friendsListScroll=0;
	}
	moveToTop=false;
}

var n=name;
with myMessageManager {
	messenger=other.messenger;
	name=n;
	profileImage=other.profilePicture;
}