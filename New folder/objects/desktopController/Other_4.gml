if live_call() return live_result;
if !loadData("heardTheme", false) {
	if !audio_is_playing(bgmShrimpOS) playMusic(bgmShrimpOS);
	updateData("heardTheme", true);
	saveGame();
} else {
	playMusic(choose(bgmShrimpOS, bgmDryShrimpFi, bgmDryShrimpOS, bgmNowEnteringTheShrimpNexus));
}