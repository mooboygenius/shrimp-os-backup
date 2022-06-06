if live_call() return live_result;

event_inherited();

tileSet=tlsMumbaSnow;

generateLevelMapArray([
"                              ",
"                              ",
"                              ",
"                              ",
"                              ",
"                              ",
"                              ",
"                              ",
"                              ",
"                              ",
"                              ",
"                              ",
"                              ",
"                              ",
"                              ",
"                              ",
"R            2               R",
"111111111111111111111111111111",
"111111111111111111111111111111",
"111111111111111111111111111111",
"111111111111111111111111111111"
]);

generateMap();

tileSet=tlsMumbaSnowSteel;

generateLevelMapArray([
"                              ",
"                              ",
"                              ",
"                              ",
"                              ",
"                              ",
"S                            S",
"                              ",
"1111                      1111",
"           11111111           ",
"                              ",
"S                            S",
"                              ",
"11111   111        111   11111",
"                              ",
"                              ",
"                              ",
"                              ",
"                              ",
"                              ",
"                              "
]);

generateMap();

generateLevelMapArray([
"                              ",
"                              ",
"                              ",
"                              ",
"                              ",
"                              ",
"                              ",
"                              ",
"//                          //",
"            //////            ",
"                              ",
"                              ",
"                              ",
"///                        ///",
"                              ",
"                              ",
"                              ",
"///////      ////      ///////",
"                              ",
"                              ",
"                              "
]);

generateMap();

back1=instance_create_depth(0, 0, 0, mumbaBackground);
back2=instance_create_depth(0, 0, 0, mumbaBackground);
back3=instance_create_depth(0, 0, 0, mumbaBackground);
back4=instance_create_depth(0, 0, 0, mumbaBackground);
var ys=0;
with back1 {
	loops=true;
	sprite_index=sprMumbaSnowSky;
	cameraXMultiplier=0;
}
with back2 {
	loops=true;
	sprite_index=sprMumbaSnowMountain3;
	cameraXMultiplier=.1;
	drawY=ys;
}
with back3 {
	loops=true;
	sprite_index=sprMumbaSnowMountain2;
	cameraXMultiplier=.3;
	drawY=ys;
}
with back4 {
	loops=true;
	sprite_index=sprMumbaSnowMountain1;
	cameraXMultiplier=.5;
	drawY=ys;
}
ds_list_add(children, back1, back2, back3, back4);

spawner=instance_create_depth(tileSurfaceWidth/2, 0, depth, mumbaEnemySpawner);
with spawner {
	normalWaves=[
	[mumbaSnowman],
	[mumbaSnowman, mumbaSnowman]
	];

	hardWaves=[
	[mumbaSnowman, mumbaSnowman, mumbaSnowman],
	[mumbaSnowman, mumbaSnowman, mumbaSnowman, mumbaSnowman],
	]
}
ds_list_add(children, spawner);

winLevelName="tenseTundra";
unlockLevels=["hazardousHeaven", "turmoilTunnels"];