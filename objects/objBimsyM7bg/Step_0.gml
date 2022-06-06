if live_call() return live_result;

event_inherited();

if(input(ord("Z"),PRESS)){
	hits++;
	if(won){
		playSound(sndBimSqueak,1,random_range(0.9,1.1),0);
		jiggle=0.55;
	}else{
		playSound(sndBimBonk,1,random_range(0.9,1.1),0);
	}
	
	shake=5;
}
smash=input(ord("Z"),HOLD);
jiggle=lerp(jiggle,0,0.1);

if(hits==5 && !won){
	won=1;
	playSound(sndBimSparkle,1,1,0);
	objBimsymanager.wonlastminigame=1;
}

if(won){
	fade=clamp(fade+0.5*objBimsymanager.gamespeed,0,6);	
}

time=(240-objBimsyminigame.timer)/60

if(shake>0){
	shake--;
	xs=irandom_range(-2,2);
	ys=irandom_range(-2,2);
}
