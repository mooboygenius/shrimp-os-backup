if live_call() return live_result;

state=0;
timer=0;
surf=surface_create(GAME_WIDTH, GAME_HEIGHT);
showText=0;
player=noone;
logoScale=0;
logoSquish=0;
with game {
	cameraZoom=.1;
}

playMusic(bgmSDLevel1Intro, false);