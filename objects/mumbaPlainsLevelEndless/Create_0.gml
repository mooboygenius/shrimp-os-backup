if live_call() return live_result;

event_inherited();

tileSet=tlsMumbaGrass;

generateLevelMapArray([
"                             ",
"                             ",
"                             ",
"                             ",
"                             ",
"S                           S",
"                             ",
"11111111             11111111",
"111                       111",
"11                         11",
"11                         11",
"11                         11",
"11                         11",
"11                         11",
"1111                     1111",
"1111                     1111",
"111111111           111111111",
"11                         11",
"1                           1",
"R           11111           R",
"R           11111           R",
"1111111111  11111  1111111111",
"1111111111  11111  1111111111",
"1111111111RR11111RR1111111111"
]);

generateMap();

tileSet=tlsMumbaLogs

generateLevelMapArray([
"11111111111111111111111111111",
"                             ",
"                             ",
"                             ",
"                             ",
"                             ",
"                             ",
"                             ",
"99                        999",
"                             ",
"          111111111        9 ",
"                           9 ",
"       111         111     9 ",
"                             ",
"                             ",
"                             ",
"999                          ",
"              2              ",
"                             ",
"                             ",
"                             ",
"                       9999  ",
"9999                         ",
"                             "
]);

generateMap();

back1=instance_create_depth(0, 0, 0, mumbaBackground);
back2=instance_create_depth(0, 0, 0, mumbaBackground);
back3=instance_create_depth(0, 0, 0, mumbaBackground);
back4=instance_create_depth(0, 0, 0, mumbaBackground);
back5=instance_create_depth(0, 0, 0, mumbaBackground);
with back1 {
	loops=true;
	sprite_index=sprMumbaPlainsSky;
	cameraXMultiplier=0;
}
with back2 {
	loops=true;
	sprite_index=sprMumbaPlainsHills;
	cameraXMultiplier=.1;
}
with back3 {
	loops=true;
	sprite_index=sprMumbaPlains1;
	cameraXMultiplier=.3;
}
with back4 {
	loops=true;
	sprite_index=sprMumbaPlains2;
	cameraXMultiplier=.4;
}
with back5 {
	loops=true;
	sprite_index=sprMumbaPlains3;
	cameraXMultiplier=.5;
}
ds_list_add(children, back1, back2, back3, back4, back5);

repeat(irandom_range(4, 6)) {
	var cloud=instance_create_depth(0, 0, 0, mumbaBeachCloud);
	with cloud {
		drawY+=random_range(0+sprite_get_yoffset(sprMumbaBeachClouds), GAME_HEIGHT*.5);
		drawX=random(other.tileSurfaceWidth)+sprite_get_xoffset(sprMumbaBeachClouds)+random(64);
	}
	ds_list_add(children, cloud);
}

spawner=instance_create_depth(tileSurfaceWidth/2, 0, depth, mumbaEnemySpawner);
with spawner {
	normalWaves=[
	[mumbaSquirrel],
	[mumbaSquirrel, mumbaSquirrel],
	[mumbaSquirrel, mumbaSquirrel],
	[mumbaSquirrel, mumbaCrab],
	[mumbaCrab, mumbaRat],
	[mumbaSquirrel, mumbaRat],
	[mumbaRat],
	[mumbaSnowman],
	[mumbaSnowman, mumbaSnowman],
	];

	hardWaves=[
	[mumbaSquirrel, mumbaSquirrel, mumbaSquirrel],
	[mumbaSquirrel, mumbaRat],
	[mumbaRat, mumbaRat],
	[mumbaSquirrel, mumbaSquirrel, mumbaSnowman],
	[mumbaSnowman, mumbaSnowman],
	]
	
	spawnTimerMaximum-=30;
	spawnTimerMinimum-=60;
	hardWaveFrequency-=1;
}
ds_list_add(children, spawner);

winLevelName="perilousPlain";
unlockLevels=["viciousVolcano", "tenseTundra"];