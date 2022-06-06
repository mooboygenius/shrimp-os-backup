if live_call() return live_result;

event_inherited();

originalScroll=0;

playOrStopSong=function() {
	/// @function playOrStopSong()
	var inst=noone,
	xs=0;
	with parentWindow {
		inst=player;
		saveSong();
		saveGame();
	}
	var p=false;
	with inst {
		xs=xstart+4;
		playing=!playing;
		if playing {
			other.sprite_index=sprStopButton;
		} else {
			other.sprite_index=sprPlayButton;
		}
		p=playing;
	}
	show_debug_message("is it playing?");
	if p {
		show_debug_message("yea its playing");
		with parentWindow {
			with parentWindow {
				other.originalScroll=scrollAmountLerp;
			}
			for (var i=0; i<ds_list_size(notes); i++) {
				with notes[| i] {
					if xstart<xs {
						played=true;
					}
				}
			}
		}
	} else {
		with parentWindow {
			//scrollAmount=other.originalScroll;
		}
	}
	squish=1;
}

clickFunction=function() {
	playOrStopSong();
}