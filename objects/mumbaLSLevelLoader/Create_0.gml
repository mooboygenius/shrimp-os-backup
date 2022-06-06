if live_call() return live_result;

event_inherited();

drawScript=function() {}

children=ds_list_create();
circle=instance_create_depth(0, 0, 0, mumbaCircleTransition);
with circle {
	circleSize=0;
	circleChange=0;
	circleX=GAME_WIDTH div 2;
	circleY=GAME_HEIGHT div 2;
}
ds_list_add(children, circle);

state=0;
timer=0;
lvl=noone;
intro=noone;
owner=noone;
goingToRealLevel=false;