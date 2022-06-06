/// @description Insert description here
// You can write your code in this editor

if live_call() return live_result;

event_inherited();

if(firesound==0){
	audio_stop_sound(manager.bimmusic);
	playSound(sndBimWow,1,1,0);
}else{
	audio_stop_sound(firesound);
}
