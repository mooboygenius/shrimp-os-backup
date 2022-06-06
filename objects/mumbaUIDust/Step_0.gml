if live_call() return live_result;

event_inherited();

drawY-=yMove*random_range(.9, 1.1);
drawX-=xMove*random_range(.5, 4);
angle+=turnSpeed;
xScale-=shrinkSpeed;
yScale=xScale;
if xScale<=0 instance_destroy();