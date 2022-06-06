if live_call() return live_result;

event_inherited();

audioPosition=audio_sound_get_track_position(audio)/audioLength;
videoIndex=round(audioPosition*sprite_get_number(sprHelpGamingVideo));

show_debug_message(concat("time: ", audioPosition, "\nindex: ", videoIndex));