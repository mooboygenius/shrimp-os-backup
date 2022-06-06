if live_call() return live_result;

surf=surface_create(GAME_WIDTH, GAME_HEIGHT);
surface_set_target(surf);
draw_clear_alpha(BLACK_COLOR, 1);
surface_reset_target();

depth=-100000;

circleRadius=0;
circleDestroy=GAME_WIDTH*2;
circleAdd=8;