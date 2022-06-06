if live_call() return live_result;

event_inherited();

fishtimer-=objBimsymanager.gamespeed;

if(fishtimer<=0 && !bit && !ranoff){
	bit=1;
	bimfr=1;
	playSound(sndBimGong,1,random_range(0.9,1.1),0);
}

if(!bit && input(ord("Z"),PRESS) && !ranoff){
		playSound(sndBimWow,1,random_range(0.9,1.1),0);
		playSound(sndBimHop,1,random_range(0.9,1.1),0);
		ranoff=1;
		bimfr=2;
		objBimsymanager.wonlastminigame=0;
	}

if(bit && !caught && !ranoff){
	catchtimer-=objBimsymanager.gamespeed;
	
	if(input(ord("Z"),PRESS)){
		playSound(sndBimCork,1,random_range(0.9,1.1),0);
		playSound(sndBimWow,1,random_range(0.9,1.1),0);
		caught=1;
		bimfr=3;
		objBimsymanager.wonlastminigame=1;
	}
	
	if(catchtimer<=0 && !caught){
		playSound(sndBimHop,1,random_range(0.9,1.1),0);
		ranoff=1;
		bimfr=2;
		objBimsymanager.wonlastminigame=0;
	}
}

if(caught){
	fade=clamp(fade+0.5*objBimsymanager.gamespeed,0,6);
	speechtxt+=string_char_at(fishtxt,tr);
	tr++;
}
