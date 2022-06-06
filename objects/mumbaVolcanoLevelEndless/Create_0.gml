if live_call() return live_result;

event_inherited();

tileSet=tlsMumbaVolcano;

generateLevelMapArray([
"                                        ",
"                                        ",
"                                        ",
"                                        ",
"                                        ",
"                                        ",
"                                        ",
"                                        ",
"                                        ",
"                                        ",
"S                                      S",
"S                                      S",
"111111        111  111  111        111111",
"R                                      R",
"R                                      R",
"R                   2                  R",
"1111111111111111111111111111111111111111",
"1111111111111111111111111111111111111111",
"1111111111111111111111111111111111111111",
"1111111111111111111111111111111111111111"
]);

generateMap();

tileSet=tlsMumbaVolcanoSteel;

generateLevelMapArray([
"                                        ",
"                                        ",
"                                        ",
"                                        ",
"                                        ",
"                                        ",
"                                        ",
"                                        ",
"         11                  11         ",
"                                        ",
"                                        ",
"                                        ",
"11111          1111111111          11111",
"                                        ",
"                                        ",
"                                        ",
"                                        ",
"                                        ",
"                                        ",
"                                        "
]);

generateMap();


tileSet=tlsMumbaVolcanoBox;

generateLevelMapArray([
"                                        ",
"                                        ",
"                                        ",
"                                        ",
"                                        ",
"                                        ",
"                                        ",
"                                        ",
"                                        ",
"                                        ",
"                                        ",
"                                        ",
"11                1 1                111",
"                                        ",
"                                        ",
"                                        ",
"1111 1       1 1111111111111       1 111",
"                                        ",
"                                        ",
"                                        "
]);

generateMap();

back1=instance_create_depth(0, 0, 0, mumbaBackground);
back2=instance_create_depth(0, 0, 0, mumbaBackground);
back3=instance_create_depth(0, 0, 0, mumbaBackground);
var ys=0;
with back1 {
	loops=true;
	sprite_index=sprMumbaVolcanoSky;
	cameraXMultiplier=0;
}

with back2 {
	loops=true;
	sprite_index=sprMumbaVolcanoBack;
	cameraXMultiplier=.1;
	drawY=ys;
}

with back3 {
	loops=true;
	sprite_index=sprMumbaVolcanoMountains;
	cameraXMultiplier=.3;
	drawY=ys;
}

ds_list_add(children, back1, back2, back3);


spawner=instance_create_depth(tileSurfaceWidth/2, 0, depth, mumbaEnemySpawner);
with spawner {
	normalWaves=[
	[mumbaTurtle],
	[mumbaTurtle, mumbaTurtle],
	[mumbaTurtle, mumbaTurtle],
	[mumbaTurtle, mumbaTurtle],
	[mumbaAngel, mumbaTurtle],
	[mumbaAngel],
	[mumbaSnowman, mumbaTurtle],
	[mumbaFungus, mumbaTurtle],
	[mumbaAngel, mumbaAngel]
	];

	hardWaves=[
	[mumbaTurtle, mumbaTurtle, mumbaTurtle],
	[mumbaTurtle, mumbaTurtle, mumbaTurtle, mumbaTurtle],
	[mumbaTurtle, mumbaTurtle, mumbaTurtle, mumbaTurtle],
	[mumbaTurtle, mumbaTurtle, mumbaAngel, mumbaAngel],
	[mumbaTurtle, mumbaTurtle, mumbaSnowman, mumbaSnowman],
	[mumbaFungus, mumbaFungus, mumbaTurtle],
	[mumbaAngel, mumbaAngel, mumbaAngel],
	[mumbaTurtle, mumbaTurtle, mumbaSnowman],
	[mumbaSnowman, mumbaSnowman, mumbaSnowman]
	]
}
ds_list_add(children, spawner);

fallingRockTimer=0;

winLevelName="viciousVolcano";
unlockLevels=["hazardousHeaven", "turmoilTunnels"];