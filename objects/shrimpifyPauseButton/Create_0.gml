if live_call() return live_result;
event_inherited();

clickFunction=function() {
	var s=.2;
	if audio_is_paused(currentMusic) {
		audio_resume_sound(currentMusic);
		sprite_index=sprShrimpifyPauseButton;
		squish=s;
	} else if audio_is_playing(currentMusic) {
		audio_pause_sound(currentMusic);
		sprite_index=sprShrimpifyPlayButton;
		squish=-s;
	}
}