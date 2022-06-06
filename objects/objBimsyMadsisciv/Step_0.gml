if live_call() return live_result;

event_inherited();

if(alive){
	if(movetimer<=0){
		xpos+=irandom_range(-1,1);
		ypos+=irandom_range(-1,1);
		movetimer=30;
	}
	movetimer-=objBimsymanager.gamespeed*move;
	
}else{
	if(ypos<h){
		ypos+=fallspd;
		fallspd+=objBimsymanager.gamespeed*0.2;
		rot+=move*5;
	}
}

x=xpos;
y=ypos;

if(place_meeting(x,y,objBimsyMadsisyelena) && alive){
		alive=0;
		objBimsyMadsisyelena.civsbumped++;
		playSound(sndBimCivhit,1,1,0);
		h=ypos;
		ypos-=1;
		if(fr==6){
			playSound(sndBimWow,1,1,0);	
		}
	
}
