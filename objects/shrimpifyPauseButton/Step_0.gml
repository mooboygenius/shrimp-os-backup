if live_call() return live_result;
event_inherited();

if audio_is_paused(currentMusic) {
	sprite_index=sprShrimpifyPlayButton;
} else if audio_is_playing(currentMusic) {
	sprite_index=sprShrimpifyPauseButton;
}