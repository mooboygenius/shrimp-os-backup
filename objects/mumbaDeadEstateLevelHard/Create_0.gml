if live_call() return live_result;

event_inherited();

tileSet=tlsMumbaDeadEstate;

generateLevelMapArray([
"1111111111111111111111111111111",
"1111111111111111111111111111111",
"1111111111111111111111111111111",
"1111111111111111111111111111111",
"111111        111        111111",
"111111        111        111111",
"               [               ",
"               [               ",
"S              [              S",
"1111111[[[[[1111111]]]]]1111111",
"11  [          ]          [  11",
"    [          ]     2    [    ",
"    [          ]          [    ",
"11111[[[111]]]111[[[111]]]11111",
"11  ]          [          ]  11",
"    ]          [          ]    ",
"    ]          [          ]    ",
"1111111111111111111111111111111",
"1111111111111111111111111111111",
"1111111111111111111111111111111",
"1111111111111111111111111111111"
]);

generateMap();

back1=instance_create_depth(0, 0, 0, mumbaBackground);
with back1 {
	loops=true;
	sprite_index=sprMumbaDeadEstateBackground;
	cameraXMultiplier=.8;
}

ds_list_add(children, back1, instance_create_depth(0, 0, 0, mumbaSwapBlockController));

spawner=instance_create_depth(tileSurfaceWidth/2, 0, depth, mumbaEnemySpawner);
with spawner {
	spawnTimerMaximum-=60;
	spawnTimerMinimum-=60;
	hardWaveFrequency-=1;
	normalWaves=[
	[mumbaGhost],
	[mumbaGhost, mumbaGhost],
	[mumbaGhost, mumbaGhost],
	[mumbaGhost, mumbaGhost, mumbaGhost]
	];

	hardWaves=[
	[mumbaGhost, mumbaGhost, mumbaGhost],
	[mumbaGhost, mumbaGhost, mumbaGhost, mumbaGhost],
	[mumbaGhost, mumbaGhost, mumbaGhost, mumbaGhost]
	]
}
ds_list_add(children, spawner);

winLevelName="deadEstate";
unlockLevels=["shrimp"];