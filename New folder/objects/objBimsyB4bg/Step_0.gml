if live_call() return live_result;

event_inherited();

biting=input(ord("Z"),HOLD);

if(input(ord("Z"),PRESS) && bites<3){
	playSound(sndBimBite,1,random_range(0.9,1.1),0);
	bites++;
	if(bites==3){
		objBimsymanager.wonlastminigame=1;	
	}
}
if(!input(ord("Z"),PRESS) && bites==3 && !content){
	content=1;
	playSound(sndBimSparkle,1,random_range(0.9,1.1),0);
}

if(content){
	fade=clamp(fade+0.5*objBimsymanager.gamespeed,0,6);		
}
