if live_call() return live_result;
// Inherit the parent event
event_inherited();

drawScript=function(x, y) {
	draw_sprite(sprite_index, 0, x, y);
}

switch isPlaying {
	case 0:
		if currentMusicIndex==myIndex {
			isPlaying=true;
			generateSprite();
		}
	break;
	
	case 1:
		if currentMusicIndex!=myIndex {
			isPlaying=false;
			generateSprite();
		}
	break;
}

drawScript=function(x, y) {
	if hoveringOver {
		y+=wave(-1, 1, .5)
		var c=make_color_rgb(47, 87, 83),
		left=x,
		top=y,
		right=x+400,
		bottom=y+sprite_height-1;
		draw_rectangle_color(left, top, right, bottom, c, c, c, c, false);
	}
	defaultDrawScript(x, y);
}

clickFunction=function() {
	squish=.1;
	if currentMusicIndex==myIndex {
		currentMusicIndex=-10000;
		audio_group_stop_all(bgm);
	} else {
		playMusicFromIndex(myIndex);
	}
}