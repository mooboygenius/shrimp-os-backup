if live_call() return live_result;

event_inherited();

clickFunction=function() {
	masterVolume-=.5;
	if masterVolume>0 masterVolume=.5;
	if masterVolume<0 masterVolume=1;
	updateSetting("masterVolume", masterVolume);
	audio_master_gain(masterVolume);
	saveGame();
}