if live_call() return live_result;
event_inherited();
var l=.5;
var gx=(window_mouse_get_x()-window_get_x())/WINDOW_SCALE,
gy=(window_mouse_get_y()-window_get_y())/WINDOW_SCALE;
if os_browser==browser_not_a_browser {
	gx=getMouseX();
	gy=getMouseY();
}
x=lerp(x, gx, l);
y=lerp(y, gy, l);

//show_debug_message(concat(x, ", ", y, "  ", mouse_x, ", ", mouse_y));
var lx=(previousX-x)*1;
angle=lerp(angle, lx, .25);
previousX=x;

if input(mb_right, PRESS) {
	show_debug_message("right clicked");
	with rightClickMenu {
		grace=max(grace, 5);
		state=menuState.close;
	}
	var inst=HIGHEST_INSTANCE_UNDER_MOUSE,
	a=-1,
	p=noone;
	with inst {
		if is_array(uniqueRightClickMenuOptions) {
			a=uniqueRightClickMenuOptions;
			p=self;
		}
	}
	with instance_create_depth(x, y, depth+1, rightClickMenu) {
		if is_array(a) {
			setMenuOptions(a);
			parent=p;
		}
	}
}

if drawing {
	sprite_index=sprCursorPencil;
} else if pullHorizontal {
	sprite_index=sprCursorStretchHorizontal;
} else if pullVertical {
	sprite_index=sprCursorStretchVertical;
} else if hoveringOver {
	sprite_index=sprCursorFinger;
} else {
	sprite_index=sprCursor;
}

hoveringOver=false;
pullHorizontal=false;
pullVertical=false;
drawing=false;

var d=depth;
with worldObject {
	if depth<d d=depth-100;
}
depth=d;