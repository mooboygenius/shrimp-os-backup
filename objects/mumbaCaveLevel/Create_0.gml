if live_call() return live_result;

event_inherited();

tileSet=tlsMumbaCave;

generateLevelMapArray([
"111111111111111111111111111111",
"111111                  111111",
"1111                      1111",
"111                        111",
"11                          11",
"11                          11",
"                              ",
"                              ",
"                              ",
"                              ",
"                              ",
"S                            S",
"                              ",
"11111   111        111   11111",
"                              ",
"                              ",
"                              ",
"1111111     111111     1111111",
"1111                      1111",
"111           2            111",
"111                        111",
"111    1111        1111    111",
"R                            R",
"R             11             R",
"R             11             R",
"111111111111111111111111111111",
"111111111111111111111111111111",
"111111111111111111111111111111",
"111111111111111111111111111111"
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
	[mumbaFungus, mumbaFungus]
	];

	hardWaves=[
	[mumbaFungus, mumbaFungus, mumbaFungus]
	]
}
ds_list_add(children, spawner);

winLevelName="turmoilTunnels";
unlockLevels=["boss"];