if live_call() return live_result;

event_inherited();

tileSet=tlsMumbaVolcano;

generateLevelMapArray([
"                                   ",
"                                   ",
"                                   ",
"                                   ",
"                                   ",
"                                   ",
"                                   ",
"                                   ",
"                                   ",
"                                   ",
"S                                 S",
"S                                 S",
"111111        1111111        111111",
"R                                 R",
"R                                 R",
"R                2                R",
"11111111111111111111111111111111111",
"11111111111111111111111111111111111",
"11111111111111111111111111111111111",
"11111111111111111111111111111111111"
]);

generateMap();

tileSet=tlsMumbaVolcanoSteel;

generateLevelMapArray([
"                                   ",
"                                   ",
"                                   ",
"                                   ",
"                                   ",
"                                   ",
"                                   ",
"                                   ",
"         11             11         ",
"                                   ",
"                                   ",
"                                   ",
"11111          11111          11111",
"                                   ",
"                                   ",
"                                   ",
"                                   ",
"                                   ",
"                                   ",
"                                   "
]);

generateMap();


tileSet=tlsMumbaVolcanoBox;

generateLevelMapArray([
"                                   ",
"                                   ",
"                                   ",
"                                   ",
"                                   ",
"                                   ",
"                                   ",
"                                   ",
"                                   ",
"                                   ",
"                                   ",
"                                   ",
"11              1 1             111",
"                                   ",
"                                   ",
"                                   ",
"1111 1       1 11111111       1 111",
"                                   ",
"                                   ",
"                                   "
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
	spawnTimerMinimum=180;
	spawnTimerMaximum=240;
	
	normalWaves=[
	[mumbaTurtle],
	[mumbaTurtle, mumbaTurtle]
	];

	hardWaves=[
	[mumbaTurtle, mumbaTurtle, mumbaTurtle],
	[mumbaTurtle, mumbaTurtle, mumbaTurtle, mumbaTurtle],
	]
}
ds_list_add(children, spawner);

fallingRockTimer=0;

winLevelName="viciousVolcano";
unlockLevels=["hazardousHeaven", "turmoilTunnels"];