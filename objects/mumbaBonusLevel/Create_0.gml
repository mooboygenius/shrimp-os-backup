if live_call() return live_result;

event_inherited();

back1=instance_create_depth(0, 0, 0, mumbaBackground);
with back1 {
	loops=true;
	horizontalSpeed=.1;
	verticalSpeed=horizontalSpeed;
	sprite_index=sprMumbaBonusBackground;
}
ds_list_add(children, back1);

state=0;
timer=0;

with mumbaPlayer {
	canMove=false;
	canControl=false;
}

circleTransition=noone;