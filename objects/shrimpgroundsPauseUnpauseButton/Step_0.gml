if live_call() return live_result;

event_inherited();

if audio_is_paused(playTrack) {
	sprite_index=sprShrimpgroundsPlayButton;
} else if audio_is_playing(playTrack) {
	sprite_index=sprShrimpgroundsPauseButton;
} else {
	sprite_index=sprShrimpgroundsPlayButton;
}