if live_call() return live_result;

// Inherit the parent event
event_inherited();

switch substate {
	case 0:
	break;
	
	case 1:
	break;
}

var sx=20,
sy=80,
bx=sx,
by=sy;
for (var i=0; i<array_length(backgrounds); i++) {
	with backgrounds[i] {
		xstart=bx;
		ystart=by;
	}
	bx+=40;
	if bx>160 {
		bx=sx;
		by+=25;
	}
}