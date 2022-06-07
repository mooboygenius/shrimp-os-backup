if live_call() return live_result;

// Inherit the parent event
event_inherited();

rot+=5;
if(rot>=360){
	rot-=360;
	spins++;
}

scale=lerp(scale,1,0.2);
