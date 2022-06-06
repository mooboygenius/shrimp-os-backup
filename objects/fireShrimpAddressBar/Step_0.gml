if live_call() return live_result;

event_inherited();

enum urlStates {idle, loading, typing}

switch substate {
	case urlStates.idle:
		// do nothing
	break;
	
	case urlStates.loading:
	break;
	
	case urlStates.typing:
		text=getStringInput(text, false);
		if input(vk_enter, RELEASE) {
			text=string_lower(text);
			if text="" text="fireshrimp";
			if !string_pos("www.", text) text="www."+text;
			if !string_pos(".shrimp", text) text=text+".shrimp";
			text=string_replace_all(text, " ", "");
			substate=urlStates.idle;
			
			var windowToCreate=shrimpNotFound;
			if ds_map_exists(realWebsites, text) {
				windowToCreate=realWebsites[? text][? "object"];
			}
			with parentWindow {
				createNewPage(windowToCreate);
			}
		}
	break;
}

clickFunction=function() {
	if substate==urlStates.typing {
		substate=urlStates.idle;
	} else {
		substate=urlStates.typing;
	}
}

if input(mb_left, PRESS) && HIGHEST_INSTANCE_UNDER_MOUSE!=id {
	if substate==urlStates.typing {
		substate=urlStates.idle;
	}
}

drawScript=function(x, y) {
	draw_self();
	var c=$734940;
	var t=text;
	draw_set_font(fntSmaller);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
	var tx=x+2,
	ty=y;
	if substate==urlStates.typing {
		c=c_white;
		var timer=500;
		if current_time%timer<(timer/2) t+="|";
	}
	draw_text_color(tx, ty, t, c, c, c, c, 1);
}