if live_call() return live_result;

event_inherited();

audio_group_stop_all(mumbaBGM);

tileSet=tlsMumbaBlank;

generateLevelMapArray([
"          2           ",
"                      ",
"                      ",
"                      ",
"                      ",
"                      ",
"                      ",
"                      ",
"                      ",
"1111111111111111111111",
"1111111111111111111111",
"1111111111111111111111"
]);

generateMap();

with mumbaPlayer {
	y-=64;
	ystart=y;
}

back1=instance_create_depth(0, 0, 0, mumbaBackground);
with back1 {
	sprite_index=sprMumbaDarkBackground;
	loops=true;
	cameraXMultiplier=1;
	cameraYMultiplier=1;
}
cont=instance_create_depth(0, 0, 0, mumbaCreditsController);
ds_list_add(children, back1, cont);