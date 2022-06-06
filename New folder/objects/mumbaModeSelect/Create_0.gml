if live_call() return live_result;

// Inherit the parent event
event_inherited();

timeTrialDataString="";
clearedHardModeDataString="";
eggathonDataString="";
perfectDataString="";

timeTrialCleared=false;
hardModeCleared=false;
eggathonCleared=false;
perfectCleared=false;

state=0;
timer=0;
with mumbaWindow {
	childrenSurfaceY=-GAME_HEIGHT*2;
}

children=ds_list_create();

back=instance_create_depth(0, 0, 0, mumbaBackground);
with back {
	loops=true;
	sprite_index=sprModeSelectBackground;
	//horizontalSpeed=.1;
	//verticalSpeed=-3;
}
mumba=instance_create_depth(2/3*GAME_WIDTH, -GAME_HEIGHT, -10, mumbaModeSelectFaller);
name=noone;
ds_list_add(children, back, mumba);

drawScript=function() {}