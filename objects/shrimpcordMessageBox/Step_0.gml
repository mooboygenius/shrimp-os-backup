if live_call() return live_result;

event_inherited();

enum messageState {idle, typing, sending}

with parentWindow {
	other.depth=depth-50;
}

switch state {
	case messageState.idle:
		if HIGHEST_INSTANCE_UNDER_MOUSE==id && input(mb_left, PRESS) {
			state=messageState.typing;
		}
	break;
	
	case messageState.typing:
		if (HIGHEST_INSTANCE_UNDER_MOUSE!=id && input(mb_left, PRESS)) || getActiveWindow()!=parentWindow.id {
			if getActiveWindow()!=parentWindow show_debug_message(concat("parent window not active: ", parentWindow, " / ", getActiveWindow()));
			if HIGHEST_INSTANCE_UNDER_MOUSE!=id show_debug_message("not highest instance under mouse");
			state=messageState.idle;
		}
		if input(vk_enter, PRESS) {
			state=messageState.sending;
		} else {
			show_debug_message(concat("in: ", in));
			in=getStringInput(in, false);
		}
	break;
	
	case messageState.sending:
		with shrimpcordMessageManager {
			createMessage("shrimpguy51", other.in);
			with owner moveToTop=true;
		}
		var n="bot", pp=sprShrimpcordDefaultIcon,
		md=.5,
		agg=.5,
		quir=.5,
		sen=.5,
		gram=.5,
		emo=.5;
		with owner {
			md=mood;
			agg=aggression;
			quir=quirky;
			sen=sensitivity;
			gram=grammarCorrectness;
			emo=usesEmojis;
			n=name;
			pp=profileImage;
		}
		with instance_create_depth(0, 0, 0, messenger) {
			mood=md;
			aggression=agg;
			quirky=quir;
			sensitivity=sen;
			usesEmojis=emo;
			grammarCorrectness=gram;
			inString=other.in;
			name=n;
			profileImage=pp;
		}
		in="";
		state=messageState.typing;
	break;
}

drawScript=function(x, y) {
	draw_set_font(fntSystem);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	defaultDrawScript(x, y);
	var c=c_white,
	t=in,
	tx=x+4,
	ty=y+4;
	if state==messageState.typing {
		if t=="" {
			c=$734940;
			t="start typing about shrimps!!";
			ty+=wave(-1, 1, .5);
		} else {
			var time=1000;
			if current_time%time<(time/2) {
				t+="|";
			}
		}
	}
	var sep=12,
	w=sprite_width-8;
	draw_text_ext_color(tx, ty, t, sep, w, c, c, c, c, 1);
}

