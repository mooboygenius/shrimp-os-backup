if live_call() return live_result;

// Inherit the parent event
event_inherited();

if x>(GAME_WIDTH+sprite_xoffset) instance_destroy();

var p=.1,
t=2;
xScale=wave(1-p, 1+p, t);
yScale=wave(1+p, 1-p, t);