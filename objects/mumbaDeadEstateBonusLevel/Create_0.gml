if live_call() return live_result;

event_inherited();

tileSet=tlsMumbaBonus;

generateLevelMapArray([
"111111  $$$$$$$$$$$$$$$$$  111111",
"111111                     111111",
"111111                     111111",
"111                           111",
"111                           111",
"111                           111",
"111                           111",
"111                           111",
"111                           111",
"111                           111",
"111                           111",
"111                           111",
"111                           111",
"111                           111",
"111                           111",
"111                           111",
"111                           111",
"111                           111",
"111                           111"
]);

generateMap();

tileSet=tlsMumbaDeadEstate;

generateLevelMapArray([
"                                 ",
"                                 ",
"                                 ",
"                                 ",
"                                 ",
"                                 ",
"                                 ",
"                2                ",
"                                 ",
"                                 ",
"                                 ",
"                                 ",
"                                 ",
"111111[[[[1]]]]111[[[[1]]]]111111",
"111111    1    111    1    111111",
"111111    1    111    1    111111",
"111111111111111111111111111111111",
"111111111111111111111111111111111",
"111111111111111111111111111111111"
]);

generateMap();

ds_list_add(children, instance_create_depth(0, 0, 0, mumbaSwapBlockController));