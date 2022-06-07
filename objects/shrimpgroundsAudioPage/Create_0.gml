if live_call() return live_result;

// Inherit the parent event
event_inherited();

assetName="Placeholder name";
author="Author";
description=""
myAudio=choose(bgmShrimpOS, bgmShrimpBattle1, bgmShrimpBattle2);

audio_pause_sound(currentMusic);

trackBar=instance_create_depth(-100, -100, depth-5, shrimpgroundsTrackBar);
pauseButton=instance_create_depth(-100, -100, depth-10, shrimpgroundsPauseUnpauseButton);
slider=instance_create_depth(-100, -100, depth-10, shrimpgroundsSlider);
ds_list_add(children, trackBar, pauseButton, slider);
for (var i=0; i<ds_list_size(children); i++) {
	with children[| i] {
		visible=false;
	}
}