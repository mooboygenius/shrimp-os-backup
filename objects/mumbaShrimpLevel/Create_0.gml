if live_call() return live_result;

event_inherited();

reallyHot=true;

tileSet=tlsMumbaShrimp;

generateLevelMapArray([
"11111111         11111111",
"1111111           1111111",
"111111             111111",
"11111               11111",
"            2            ",
"S                       S",
"                         ",
"111111    11111    111111",
"11                     11",
"R  {                 }  R",
"R                       R",
"1111111111111111111111111",
"1111111111111111111111111",
"                         ",
"                         ",
"S          { }          S",
"                         ",
"111111    11111    111111",
"11                     11",
"R                       R",
"R                       R",
"1111111111111111111111111",
"1111111111111111111111111",
"1111111111111111111111111",
"1111111111111111111111111"
]);

generateMap();

tileSet=tlsMumbaShrimpPlatform;

generateLevelMapArray([
"                         ",
"                         ",
"                         ",
"999                  9999",
"                         ",
"                         ",
"                         ",
"9999                 9999",
"                         ",
"                         ",
"                         ",
"99999 999  99     9999 99",
"                         ",
"                         ",
"                         ",
"                         ",
"                         ",
"9999                 9999",
"                         ",
"                         ",
"                         ",
"99999    99999 999  99999",
"                         ",
"                         ",
"                         "
]);

generateMap();

back1=instance_create_depth(0, 0, 0, mumbaUnderwaterBackground);
back2=instance_create_depth(0, 0, 0, mumbaUnderwaterBackground);
back3=instance_create_depth(0, 0, 0, mumbaUnderwaterBackground);
with back1 {
	loops=true;
	sprite_index=sprMumbaShrimpBack1;
	cameraXMultiplier=.3;
}
with back2 {
	loops=true;
	sprite_index=sprMumbaShrimpBack2;
	cameraXMultiplier=.5;
}
with back3 {
	loops=true;
	sprite_index=sprMumbaShrimpBack3;
	cameraXMultiplier=.7;
}
ds_list_add(children, back1, back2, back3);

spawner=instance_create_depth(tileSurfaceWidth/2, 0, depth, mumbaEnemySpawner);
with spawner {
	normalWaves=[
	[mumbaShrimp],
	[mumbaShrimp, mumbaShrimp]
	];

	hardWaves=[
	[mumbaShrimp, mumbaShrimp, mumbaShrimp]
	]
}
ds_list_add(children, spawner);

winLevelName="shrimp";