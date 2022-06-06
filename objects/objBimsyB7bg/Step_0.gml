if live_call() return live_result;

event_inherited();

if(!died){
	starttimer-=objBimsymanager.gamespeed;
}

if(starttimer<=0 && !shot && !died){
	if(!sound){
		playSound(sndBimHit,1,1,0);
		sound=1;	
		gunsout=1;
	}
	waitscale=lerp(waitscale,1,0.2);
	
	shoottimer-=objBimsymanager.gamespeed;
	if(input(ord("Z"),PRESS)){
		playSound(sndBimExplosion,1,1,0);
		shot=1;
		expos=96;
		objBimsymanager.wonlastminigame=1;
	}
	if(shoottimer<=0){
		playSound(sndBimExplosion,1,1,0);
		died=1;
		expos=32;
	}
}else{
		if(input(ord("Z"),PRESS) && !died){
			playSound(sndBimExplosion,1,1,0);
			playSound(sndBimBaby,1,1,0);
			died=1;
			expos=32;
		}
}

if(shot||died){
	exframe=clamp(exframe+objBimsymanager.gamespeed*0.5,0,15);
}
