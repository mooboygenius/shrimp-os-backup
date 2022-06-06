if live_call() return live_result;

event_inherited();

if masterVolume==0 {
	buttonSprite=sprMutedVolume;
} else if masterVolume<=.5 {
	buttonSprite=sprHalfVolume;
} else {
	buttonSprite=sprMaxVolume;
}