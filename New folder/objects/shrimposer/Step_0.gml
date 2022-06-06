if live_call() return live_result;

event_inherited();

switch substate {
	case 0:
		var p=false;
		
		with player {
			p=playing;
		}
		
		if !p {
			var spd=24,
			scroll=(mouse_wheel_down()-mouse_wheel_up())*spd;
			scrollAmount+=scroll;
			scrollAmount=round(scrollAmount/24)*24;
		} else {
			var xs=0;
			with player {
				xs=startX;
			}
			scrollAmount=-xs+50;
		}
		minimumScroll=-GAME_WIDTH*8;
		scrollAmount=clamp(scrollAmount, minimumScroll, maximumScroll);
		scrollAmountLerp=lerp(scrollAmountLerp, scrollAmount, .5);
		
		if getActiveWindow()!=self scroll=0;
		for (var i=0; i<ds_list_size(notes); i++) {
			with notes[| i] {
				scrollX=other.scrollAmountLerp;
			}
		}
		
		var p=false;
		with player {
			scrollX=other.scrollAmountLerp;
		}
		
		with mouseInstrument {
			scrollX=other.scrollAmountLerp;
		}
	break;
}