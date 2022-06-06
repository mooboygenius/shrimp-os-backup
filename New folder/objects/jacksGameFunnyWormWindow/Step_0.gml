if live_call() return live_result;

event_inherited();
var xr=irandom_range(-1, 1),
yr=irandom_range(-1, 1);
border[borders.left][0]+=xr;
border[borders.right][0]+=xr;
border[borders.top][0]+=yr;
border[borders.bottom][0]+=yr;

name=choose("IDIOT", "DUMBASS", "BUFFOON", "NIMROD", "NUMBSKULL", "DIPSHIT", "DUMMY", "MORON");