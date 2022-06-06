if live_call() return live_result;

event_inherited();
playTrack=bgmShrimpOS;
clickFunction=function() {
	var s=.2;
	if audio_is_paused(playTrack) {
		//show_debug_message(audio_get_name(currentMusic));
		audio_resume_sound(playTrack);
		sprite_index=sprShrimpifyPauseButton;
		squish=s;
	} else if audio_is_playing(playTrack) {
		audio_pause_sound(playTrack);
		sprite_index=sprShrimpifyPlayButton;
		squish=-s;
	} else {
		playMusic(playTrack);
	}
}