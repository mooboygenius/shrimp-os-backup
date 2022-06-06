if live_call() return live_result;
event_inherited();
depth-=100;
previousX=x;
hoveringOver=false;
pullHorizontal=false;
pullVertical=false;
drawing=false;
if instance_number(cursor)>1 instance_destroy();