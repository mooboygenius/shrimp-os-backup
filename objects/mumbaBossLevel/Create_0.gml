if live_call() return live_result;

event_inherited();

tileSet=tlsMumbaBlank;

generateLevelMapArray([
"                               ",
"                               ",
"                               ",
"                               ",
"                               ",
"                               ",
"              2                ",
"                               ",
"                               ",
"                               ",
"                               ",
"1111111111111111111111111111111",
"1111111111111111111111111111111",
"1111111111111111111111111111111",
"1111111111111111111111111111111",
]);

generateMap();

back1=instance_create_depth(0, 0, 0, mumbaBackground);
with back1 {
	sprite_index=sprMumbaDarkBackground;
}
ds_list_add(children, back1);

state=0;
state=0;
timer=0;

whiteFlash=noone;
freakyBack=noone;

winLevelName="boss";
unlockLevels=["deadEstate"];