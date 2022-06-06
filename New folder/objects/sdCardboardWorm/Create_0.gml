if live_call() return live_result;

event_inherited();

angle=irandom_range(-5, 5);
timer=irandom(-30);
var d=irandom(360),
spd=.05;
horizontalSpeed=lengthdir_x(spd, d);
verticalSpeed=lengthdir_y(spd, d);
state=0;