if live_call() return live_result;

event_inherited();

xScale=lerp(xScale, 1, .2);
yScale=xScale;

var a=0;
if hoveringOver a=wave(-1, 1, 1)*20;
angle=lerp(angle, a, .5);
yOffset=lerp(yOffset, 0, .2);

var yo=wave(0, 2, 1, xstart/5);
if hoveringOver yo=wave(-2, -4, 1);
yOffset=lerp(yOffset, yo, .5);