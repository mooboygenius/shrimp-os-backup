if live_call() return live_result;

event_inherited();

fishtimer-=objBimsymanager.gamespeed;

if(fishtimer<=0 && !bit && !ranoff){
	bit=1;
	bimfr=1;
	ring=playSound(sndBimPhone,1,random_range(0.9,1.1),0);
}

if(!bit && input(ord("Z"),PRESS) && !ranoff){
		playSound(sndBimPhonebark,1,1,0);
		ranoff=1;
		bimfr=2;
		objBimsymanager.wonlastminigame=0;
	}

if(bit && !caught && !ranoff){
	catchtimer-=objBimsymanager.gamespeed;
	phonerot+=objBimsymanager.gamespeed;
	
	if(input(ord("Z"),PRESS)){
		image_speed=objBimsymanager.gamespeed;
		if(objBimsymanager.shrimpmode){
			butterfly=playSound(sndBimShrimpos,1,objBimsymanager.gamespeed,1);	
		}else{
			butterfly=playSound(sndBimPhonebutterfly,1,objBimsymanager.gamespeed,1);
		}
		
		caught=1;
		objBimsymanager.wonlastminigame=1;
		audio_stop_sound(ring);
		audio_stop_sound(objBimsymanager.bimmusic);
	}
	
	if(catchtimer<=0 && !caught){
		playSound(sndBimPhonetalk,1,1,0);
		ranoff=1;
		bimfr=2;
		objBimsymanager.wonlastminigame=0;
	}
}
