if live_call() return live_result;

event_inherited();

switch substate {
	case 0:
	break;
	
	case 1:
		if input(mb_left, PRESS) && !HIGHEST_INSTANCE_UNDER_MOUSE!=id {
			substate=0;
		}
		text=getStringInput(text, false);
		if getActiveWindow()==parentWindow.id && input(vk_enter, PRESS) {
			var inst=noone;
			with parentWindow {
				inst=createNewPage(shrimpleSearch);
			}
			with inst {
				searchBar.text=other.text;
				generateSearchResults(other.text);
			}
		}
	break;
}

clickFunction=function() {
	substate=!substate;
}

drawScript=function(x, y) {
	defaultDrawScript(x, y);
	buttonDrawScript(x, y);
	draw_set_font(fntSystem);
	draw_set_color($B8A44F);
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	var t=text,
	tx=x-sprite_xoffset+20,
	ty=y;
	var time=800;
	if substate==1 && current_time%time<time/2 {
		t+="_";
	}
	draw_text(tx, ty, t);
}