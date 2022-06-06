if live_call() return live_result;

event_inherited();

tileSet=tlsMumbaCave;

generateLevelMapArray([
"11111111111111111111111111111111111",
"111111                       111111",
"1111                           1111",
"111                             111",
"11                               11",
"11                               11",
"                                   ",
"                                   ",
"                                   ",
"                                   ",
"                                   ",
"S                                 S",
"                                   ",
"11111   11111         11111   11111",
"                                   ",
"                                   ",
"                                   ",
"1111111     11111111111     1111111",
"1111                           1111",
"111                             111",
"111     111      2     111      111",
"111                             111",
"R                                 R",
"R             1111111             R",
"R             1111111             R",
"11111111111111111111111111111111111",
"11111111111111111111111111111111111",
"11111111111111111111111111111111111",
"11111111111111111111111111111111111"
]);

generateMap();

darkness=instance_create_depth(0, 0, depth-1000, mumbaDarkness);

back1=instance_create_depth(0, 0, 0, mumbaBackground);
back2=instance_create_depth(0, 0, 0, mumbaBackground);
with back1 {
	loops=true;
	sprite_index=sprMumbaCavesBack1;
	cameraXMultiplier=.2;
}

with back2 {
	loops=true;
	sprite_index=sprMumbaCavesBack2;
	cameraXMultiplier=.4;
}

ds_list_add(children, back1, back2, darkness);

spawner=instance_create_depth(tileSurfaceWidth/2, 0, depth, mumbaEnemySpawner);
with spawner {
	normalWaves=[
	[mumbaFungus],
	[mumbaFungus],
	[mumbaFungus, mumbaFungus],
	[mumbaFungus, mumbaFungus],
	[mumbaFungus, mumbaFungus],
	[mumbaFungus, mumbaGhost],
	[mumbaFungus, mumbaSnowman],
	[mumbaFungus, mumbaTurtle],
	[mumbaGhost, mumbaGhost]
	];

	hardWaves=[
	[mumbaFungus, mumbaFungus, mumbaFungus],
	[mumbaFungus, mumbaFungus, mumbaFungus, mumbaFungus],
	[mumbaFungus, mumbaFungus, mumbaFungus, mumbaGhost],
	[mumbaFungus, mumbaFungus, mumbaFungus, mumbaSnowman],
	[mumbaFungus, mumbaFungus, mumbaTurtle, mumbaTurtle],
	]
}
ds_list_add(children, spawner);

winLevelName="turmoilTunnels";
unlockLevels=["boss"];