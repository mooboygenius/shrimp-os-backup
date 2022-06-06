if live_call() return live_result;

event_inherited();

tileSet=tlsMumbaBrick;

generateLevelMapArray([
"1111111111111111 S  1111111111111111",
"1111111111111111    1111111111111111",
"1111111111111111    1111111111111111",
"11111                          11111",
"1111                            1111",
"111                              111",
"",
"",
"",
"111         111111111111         111",
"111                              111",
"111                              111",
"11111                          11111",
"11111        2                 11111",
"111111111   1111    1111   111111111",
"111111111   1111    1111   111111111",
"11111                          11111",
"11111                          11111",
"11111                          11111",
"        111111        111111        ",
"R                                  R",
"R                                  R",
"111111111111111111111111111111111111",
"111111111111111111111111111111111111",
"111111111111111111111111111111111111",
"111111111111111111111111111111111111"
]);

generateMap();

tileSet=tlsMumbaCityPipes;

generateLevelMapArray([
"    9   9    9       9  9  9        ",
"    9   9    9       9999  9        ",
"  999   999999             999999999",
"  9                                 ",
"999                                 ",
"                                    ",
"                                    ",
"                                    ",
"                                    ",
"                                    ",
"                                 999",
"                                 9  ",
"9999                             9  ",
"   9                           999  ",
"   99                          9    ",
"    9                          999  ",
"    9                            9  ",
"99999                            999",
"                                    ",
"                                    ",
"                                    ",
"                                    ",
"        99999999  9999999           ",
"999999999      9  9     9         99",
"  9            9  9     999999    9 ",
"  9            9  9          9    9 "
]);

generateMap();

tileSet=tlsMumbaCityDrain;

generateLevelMapArray([
"                                    ",
"                                    ",
"      9              9   9          ",
"                                    ",
"                                    ",
"                                    ",
"                                    ",
"                                    ",
"                                    ",
"                                    ",
"                                    ",
" 9                                  ",
"                                    ",
"                                    ",
"                                    ",
"  9          9                      ",
"                                    ",
"                                9   ",
"                                    ",
"                                    ",
"                                    ",
"                                    ",
"                                    ",
"                          9   9     ",
"          9  9                      ",
"                                    "
]);

generateMap();

tileSet=tlsMumbaCityThing;

generateLevelMapArray([
"                                    ",
"                                    ",
"                                    ",
"                                    ",
"                                    ",
"                                    ",
"                                    ",
"                                    ",
"                                    ",
"999           999  999           999",
"                                    ",
"                                    ",
"                                    ",
"                                    ",
"            9999    9999            ",
"                                    ",
"                                    ",
"                                    ",
"                                    ",
"         9  9          9  9         ",
"                                    ",
"                                    ",
"99999                          99999",
"                                    ",
"                                    ",
"                                    "
]);

generateMap();

movingPlatform1=instance_create_depth(tileSurfaceWidth div 2, 232, -10, mumbaMovingPlatform);
ds_list_add(children, movingPlatform1);
with movingPlatform1 {
	top=y;
	bottom=y+80;
}

back1=instance_create_depth(0, 0, 0, mumbaBackground);
back2=instance_create_depth(0, 0, 0, mumbaBackground);
back3=instance_create_depth(0, 0, 0, mumbaBackground);
back4=instance_create_depth(0, 0, 0, mumbaBackground);
var ys=-32;
with back1 {
	loops=true;
	sprite_index=sprMumbaCitySky;
	cameraXMultiplier=0;
}
with back2 {
	loops=true;
	sprite_index=sprMumbaCity3;
	cameraXMultiplier=.3;
}
with back3 {
	loops=true;
	sprite_index=sprMumbaCity2;
	cameraXMultiplier=.2;
}
with back4 {
	loops=true;
	sprite_index=sprMumbaCity1;
	cameraXMultiplier=.1;
}
ds_list_add(children, back1, back2, back3, back4);

spawner=instance_create_depth(tileSurfaceWidth/2, 0, depth, mumbaEnemySpawner);
with spawner {
	normalWaves=[
	[mumbaRat],
	[mumbaRat, mumbaRat]
	];

	hardWaves=[
	[mumbaRat, mumbaRat, mumbaRat],
	[mumbaRat, mumbaRat, mumbaRat],
	[mumbaRat, mumbaRat, mumbaRat, mumbaRat]
	]
}
ds_list_add(children, spawner);

winLevelName="manicMetropolis";
unlockLevels=["viciousVolcano", "tenseTundra"];