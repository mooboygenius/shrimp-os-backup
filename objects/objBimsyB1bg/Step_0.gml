if live_call() return live_result;

event_inherited();

if(!hit && input(ord("Z"),PRESS)){
	hit=1;
	if(image_index>=7 && image_index<=15){
		objBimsymanager.wonlastminigame=1;
		sprite_index=sprBimsygolfguykick
		playSound(sndBimKick,1,1,0);
	}else{
		sprite_index=sprBimsygolfguysleep
		playSound(sndBimBaby,1,1,0);
	}
}

if(hit && objBimsymanager.wonlastminigame){
	fade=clamp(fade+0.5*objBimsymanager.gamespeed,0,6);	
	bally=clamp(bally+0.5,bally,41);
	if(bally==41 && !putt){
		putt=1;	
		playSound(sndBimPutt,1,1,0);
	}
}

if(putt){
	holesize=lerp(holesize,1,0.1);	
}
