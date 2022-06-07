if live_call() return live_result;

event_inherited();

audio_pause_sound(currentMusic);

audio=playSound(sfxHelpGamingAudio, false, 1, true);
audioLength=audio_sound_length(sfxHelpGamingAudio);
audioPosition=0;
videoIndex=0;