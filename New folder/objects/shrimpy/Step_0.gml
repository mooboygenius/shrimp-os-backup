if live_call() return live_result;

event_inherited();

switch state {
	case 0:
		y=lerp(y, 140+wave(-1, 1, 2)*2, .2);
		angle=round(wave(-1, 1, 1))*4;
		copy++;
		if copy<string_length(text) {
			sprite_index=sprShrimpyTalk;
		} else {
			sprite_index=sprShrimpyIdle;
		}
		
		destroyScript();
		
		if (getHighestInstanceUnderMouse()==id || (instance_exists(textBub) && getHighestInstanceUnderMouse()==textBub.id)) && input(mb_left, PRESS) {
			repeat(5) show_debug_message("clicked");
			state=1;
			with textBub {
				instance_destroy();
			}
		}
	break;
	
	case 1:
		squish=lerp(squish, -1, .2);
		y+=8;
		if y>GAME_HEIGHT+sprite_height*2 {
			instance_destroy();
		}
	break;
}

//show_debug_message(concat("shrimpy: ", state));

var d=depth;
with worldObject {
	if object_index!=cursor {
		if depth<d d=depth-10;
	}
}
depth=d;

with textBub {
	depth=other.depth+1;
	x=floor(other.x-13);
	y=floor(other.y-9);
	text=string_copy(other.text, 1, other.copy);
	var l=.5;
	var w=string_width_ext(other.text, textSep, textWidth),
	h=string_height_ext(other.text, textSep, textWidth);
	image_xscale=lerp(image_xscale, ceil(w/(sprite_get_width(sprite_index)-2)/.2)*.2, l);
	image_yscale=lerp(image_yscale, ceil(max(h, 10)/(sprite_get_height(sprite_index)-11)/.1)*.1, l);
}