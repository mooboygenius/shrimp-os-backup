if live_call() return live_result;

event_inherited();

for (var i=ds_list_size(messages)-1; i>=0; i--) {
	var inst=messageObjects[| i];
	
	with parentWindow {
		if !ds_list_find_index(children, inst) {
			ds_list_add(children, inst);
			show_debug_message("appended new message to parent window's child objects");
		}
	}
	
	with inst {
		other.startY-=breakHeight;
		xstart=other.startX;
		ystart=lerp(ystart, other.startY, .5);
		other.startY-=10;
		maxWidth=other.portWidth-132;
	}
}
scrollYLerp=lerp(scrollYLerp, scrollY, .3);
startY=106-scrollYLerp;

with parentWindow {
	if !ds_list_find_index(children, other.messageBox) {
		ds_list_add(children, other.messageBox);
		show_debug_message("appended message box to parent window's child objects");
	}
	other.portWidth=portWidth;
	other.portHeight=portHeight;
}

with messageBox {
	owner=other;
	messenger=other.messenger;
	xstart=108;
	ystart=other.portHeight-sprite_height-4;
	setSpriteSize(other.portWidth-xstart-2, sprite_height);
}

if moveToTop {
	moveToTop=false;
	with owner {
		moveToTop=true;
	}
}