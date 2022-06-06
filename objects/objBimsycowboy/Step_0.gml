if live_call() return live_result;

event_inherited();

xpos+=spd;

if(input(ord("Z"),PRESS) && !stopped && !slipped){
	stopped=1;
	playSound(sndBimsySkid,1,random_range(0.9,1.1),0);
}

if(stopped){
	spd=lerp(spd,0,0.2);	
}

if(xpos>60 && !stopped){
	if(!slipped){
		objBimsymanager.wonlastminigame=0;
		slipped=1;
		playSound(sndBimsySlip,1,random_range(0.9,1.1),0);
		sprite_index=sprBimsyCowboyfall;
	}
	ypos+=fallspd;
	fallspd+=0.2*objBimsymanager.gamespeed;
	if(!crashed && ypos>96){
		crashed=1;
		playSound(sndBimsyUmineko,1,random_range(0.9,1.1),0);
	}
}

