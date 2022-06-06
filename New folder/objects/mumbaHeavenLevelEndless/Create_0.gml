if live_call() return live_result;

event_inherited();

tileSet=tlsMumbaClouds;

generateLevelMapArray([
"11111111111111111111111111111",
"                             ",
"                             ",
"                             ",
"                             ",
"S                           S",
"1111???1111       1111???1111",
"                             ",
"                             ",
"                             ",
"1111   1111???????1111   1111",
"                             ",
"                             ",
"                             ",
"111111      ?????      111111",
"R                           R",
"R                           R",
"R             2             R",
"11111111111111111111111111111",
"11111111111111111111111111111",
"11111111111111111111111111111",
"11111111111111111111111111111",
"11111111111111111111111111111"
]);

generateMap();

tileSet=tlsMumbaHeavenBricks;

generateLevelMapArray([
"                             ",
"                             ",
"                             ",
"                             ",
"                             ",
"                             ",
"9                           9",
"                             ",
"                             ",
"                             ",
"99                         99",
"                             ",
"                             ",
"                             ",
"999                       999",
"                             ",
"                             ",
"                             ",
"                             ",
"999        9999999        999",
"99999999999999999999999999999",
"99999999999999999999999999999",
"99999999999999999999999999999"
]);

generateMap();

back1=instance_create_depth(0, 0, 0, mumbaBackground);
with back1 {
	loops=true;
	sprite_index=sprMumbaHeavenSky;
	cameraXMultiplier=0;
}

back2=instance_create_depth(0, 0, 0, mumbaBackground);
with back2 {
	loops=true;
	sprite_index=sprMumbaHeavenMountains;
	cameraXMultiplier=.3;
}

ds_list_add(children, back1, back2);

repeat(irandom_range(4, 6)) {
	var cloud=instance_create_depth(0, 0, 0, mumbaHeavenCloud);
	with cloud {
		drawY+=random_range(0+sprite_get_yoffset(sprMumbaHeavenClouds), GAME_HEIGHT*.5);
		drawX=random(other.tileSurfaceWidth)+sprite_get_xoffset(sprMumbaHeavenClouds)+random(64);
	}
	ds_list_add(children, cloud);
}

spawner=instance_create_depth(tileSurfaceWidth/2, 0, depth, mumbaEnemySpawner);
with spawner {
	spawnTimerMinimum=270;
	spawnTimerMaximum=330;
	
	normalWaves=[
	[mumbaAngel],
	[mumbaAngel, mumbaAngel],
	[mumbaAngel, mumbaAngel],
	[mumbaAngel, mumbaAngel],
	[mumbaAngel, mumbaAngel],
	[mumbaAngel, mumbaSquirrel],
	[mumbaSquirrel, mumbaSquirrel],
	[mumbaAngel, mumbaSnowman],
	[mumbaSquirrel, mumbaSnowman],
	[mumbaSquirrel, mumbaFungus],
	[mumbaFungus],
	[mumbaSquirrel],
	[mumbaGhost],
	[mumbaGhost, mumbaGhost]
	];

	hardWaves=[
	[mumbaAngel, mumbaAngel, mumbaAngel],
	[mumbaAngel, mumbaAngel, mumbaSnowman],
	[mumbaAngel, mumbaAngel, mumbaFungus],
	[mumbaAngel, mumbaAngel, mumbaSquirrel],
	[mumbaAngel, mumbaSquirrel, mumbaSquirrel],
	[mumbaAngel, mumbaAngel, mumbaAngel, mumbaSnowman],
	[mumbaAngel, mumbaAngel, mumbaAngel, mumbaAngel],
	[mumbaAngel, mumbaAngel, mumbaAngel, mumbaAngel],
	[mumbaAngel, mumbaAngel, mumbaAngel, mumbaGhost],
	[mumbaAngel, mumbaAngel, mumbaGhost, mumbaGhost],
	]
}
ds_list_add(children, spawner);

winLevelName="hazardousHeaven";
unlockLevels=["boss"];