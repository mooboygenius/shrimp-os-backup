if live_call() return live_result;

event_inherited();

tileSet=tlsMumbaDeadEstate;

generateLevelMapArray([
"111111111111111111111111111111111111111111",
"111111111111111111111111111111111111111111",
"111111111111111111111111111111111111111111",
"111111111111111111111111111111111111111111",
"111111        111        111        111111",
"111111        111        111        111111",
"               ]          [               ",
"               ]          [               ",
"S              ]          [              S",
"1111111[[[[[1111111    1111111]]]]]1111111",
"11             [          ]             11",
"               [     2    ]               ",
"               [          ]               ",
"11111[[[111]]]111[[[111]]]11[[[111]]]11111",
"11             ]          [             11",
"               ]          [               ",
"R              ]          [              R",
"111111111111111111111111111111111111111111",
"111111111111111111111111111111111111111111",
"111111111111111111111111111111111111111111",
"111111111111111111111111111111111111111111"
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
	normalWaves=[
	[mumbaGhost],
	[mumbaGhost, mumbaGhost],
	[mumbaGhost, mumbaGhost],
	[mumbaGhost, mumbaCrab],
	[mumbaCrab, mumbaCrab],
	[mumbaRat, mumbaRat],
	[mumbaGhost, mumbaRat],
	[mumbaGhost, mumbaTurtle],
	[mumbaTurtle],
	[mumbaCrab]
	];

	hardWaves=[
	[mumbaGhost, mumbaGhost, mumbaGhost],
	[mumbaGhost, mumbaGhost, mumbaGhost, mumbaGhost],
	[mumbaGhost, mumbaGhost, mumbaGhost, mumbaGhost],
	[mumbaGhost, mumbaGhost, mumbaGhost, mumbaTurtle],
	[mumbaGhost, mumbaGhost, mumbaRat, mumbaRat],
	[mumbaGhost, mumbaGhost, mumbaGhost, mumbaRat],
	[mumbaGhost, mumbaGhost, mumbaCrab, mumbaCrab],
	[mumbaGhost, mumbaCrab, mumbaCrab, mumbaCrab],
	]
}
ds_list_add(children, spawner);

winLevelName="deadEstate";
unlockLevels=["shrimp"];