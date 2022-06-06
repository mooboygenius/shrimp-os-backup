if live_call() return live_result;

event_inherited();

text="HAVE FUN\nSHIT FOR BRAINS";
centerWindow(self);

audio_group_stop_all(bgm);

if !instance_exists(jacksGameCrazySequence) instance_create_depth(0, 0, 0, jacksGameCrazySequence);