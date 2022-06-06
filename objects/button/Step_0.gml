if live_call() return live_result;

event_inherited();

var mouseIsInArea=true;
if parentWindow!=noone && instance_exists(parentWindow) && !visible {
	mouseIsInArea=false;
	var left=bbox_left,
	top=bbox_top,
	right=bbox_right,
	bottom=bbox_bottom,
	portLeft=0,
	portTop=0,
	portRight=0,
	portBottom=0;
	with parentWindow {
		portLeft=portX;
		portTop=portY;
		portRight=portX+portWidth;
		portBottom=portY+portHeight;
	}
	left=max(left, portLeft);
	top=max(top, portTop);
	right=min(right, portRight);
	bottom=min(bottom, portBottom);
	mouseIsInArea=point_in_rectangle(getMouseX(), getMouseY(), left, top, right, bottom);
	
}

switch state {
	case 0:
		if switchImageIndexWhenHovering image_index=hoveringOver;
		if HIGHEST_INSTANCE_UNDER_MOUSE==id && mouseIsInArea {
			//show_debug_message("mouse is hovering over me");
			setMouseHoveringOver();
			hoveringOver=true;
			if input(mb_left, clickType) {
				//show_debug_message("detected click");
				clickFunction();
			}
		} else {
			hoveringOver=false;
		}
	break;
}