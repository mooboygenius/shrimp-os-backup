if live_call() return live_result;

event_inherited();

generateLevelMapArray([
"",
"",
"",
"",
"",
"              2",
"",
"",
"",
"",
"R                              R",
"R                              R",
"11111111111111111111111111111111",
"11111111111111111111111111111111",
"11111111111111111111111111111111",
"11111111111111111111111111111111",
"11111111111111111111111111111111"
]);

generateMap();

tileSet=tlsMumbaBeachPlanks;

generateLevelMapArray([
"",
"",
"",
"S                              S",
"1111111                  1111111",
" 1                            1 ",
" 1                            1 ",
"                                ",
"       111111      111111       ",
"",
"",
"",
"111100000001110000001111",
"",
"",
"",
""
]);

generateMap();

back1=instance_create_depth(0, 0, 0, mumbaBackground);
back2=instance_create_depth(0, 0, 0, mumbaBeachWater1);
back3=instance_create_depth(0, 0, 0, mumbaBeachWater2);
back4=instance_create_depth(0, 0, 0, mumbaBeachWater3);
with back1 {
	loops=true;
	sprite_index=sprMumbaBeachSky;
}
ds_list_add(children, back1, back2, back3, back4);

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
		[mumbaCrab],
		[mumbaCrab, mumbaCrab],
		[mumbaCrab, mumbaCrab],
		[mumbaCrab, mumbaSquirrel],
		[mumbaCrab, mumbaCrab, mumbaSquirrel],
		[mumbaSquirrel, mumbaSquirrel],
		[mumbaRat, mumbaCrab],
		[mumbaRat, mumbaSquirrel],
		[mumbaRat],
		[mumbaSquirrel],
		[mumbaCrab, mumbaCrab],
		[mumbaCrab, mumbaCrab],
		[mumbaCrab, mumbaCrab],
		[mumbaCrab],
		[mumbaCrab]
	];

	hardWaves=[
		[mumbaCrab, mumbaCrab, mumbaCrab],
		[mumbaCrab, mumbaCrab, mumbaCrab, mumbaCrab],
		[mumbaCrab, mumbaCrab, mumbaCrab, mumbaCrab, mumbaSquirrel],
		[mumbaSquirrel, mumbaSquirrel, mumbaRat],
		[mumbaRat, mumbaRat, mumbaSquirrel],
		[mumbaCrab, mumbaCrab, mumbaRat, mumbaRat],
		[mumbaCrab, mumbaCrab, mumbaSquirrel, mumbaSquirrel]
	]
	
	hardWaveFrequency=5;
}

ds_list_add(children, spawner);

winLevelName="beginnerBeach";
unlockLevels=["manicMetropolis", "perilousPlain"];