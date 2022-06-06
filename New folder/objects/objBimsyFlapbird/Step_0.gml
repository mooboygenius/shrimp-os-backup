if live_call() return live_result;

event_inherited();

if(!dead){
	ypos+=yspd;
	yspd+=objBimsymanager.gamespeed*0.08;
	rot=clamp(rot-objBimsymanager.gamespeed,-45,45);
	
	if(input(ord("Z"),PRESS)){
		playSound(sndBimHop,1,1,0);
		yspd=-1.5*objBimsymanager.gamespeed;
		rot=45;
	}
	
}

x=xpos;
y=ypos;

if((ypos<=14 || ypos>= 112)&& !dead){
	if(ypos>= 112){
		yspd=-2;	
	}
	dead=1;	
	objBimsymanager.wonlastminigame=0;
	playSound(sndBimSlimo,1,1,0);
}

if(place_meeting(x,y,objBimsyFlapspike) && !dead){
	yspd=-2;
	dead=1;
	playSound(sndBimSlimo,1,1,0);
	objBimsymanager.wonlastminigame=0;
}

if(dead){
	ypos+=yspd;
	yspd+=objBimsymanager.gamespeed*0.1;
	rot+=objBimsymanager.gamespeed*5;
}
