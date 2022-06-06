if live_call() return live_result;

var yo=0;

event_inherited();

var passed=false;
with shrimposerPlayer {
	if startX>=other.startX && playing {
		passed=true;
	} else {
		other.played=false;
	}
}

if passed && !played {
	squish=.2;
	played=true;
	scrollY=-2;
	yOffset=-4;
	image_speed=1;
	image_index=1;
	playSound(asset, 100, 1);
}

life++;

with parentWindow {
	other.x=other.xstart+portX;
	other.y=other.ystart+portY;
}

xstart=startX+scrollX;
ystart=startY+scrollY;
scrollY=lerp(scrollY, 0, .5);

var s=1,
a=0;
if hoveringOver {
	s=wave(1, 1.5, 1);
	a=wave(-1, 1, .5)*10;
	yo=wave(0, -4, 1, .1);
}

angle=lerp(angle, a, .5);
xScale=lerp(xScale, s, .5);
yOffset=lerp(yOffset, yo, .5);
yScale=xScale;