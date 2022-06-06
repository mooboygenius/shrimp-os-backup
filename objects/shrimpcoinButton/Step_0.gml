if live_call() return live_result;

event_inherited();

var sc=1,
a=wave(-1, 1, 2)*2,
l=.3;
if hoveringOver {
	sc=1.05;
	a*=5;
}
xScale=lerp(xScale, sc, l);
yScale=lerp(yScale, sc, l);
angle=lerp(angle, a, l);