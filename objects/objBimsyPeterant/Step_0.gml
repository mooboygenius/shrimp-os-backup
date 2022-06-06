if live_call() return live_result;

event_inherited();

if(!dead){
	xpos+=spd*facing;

	if(xpos>=105){
		xpos=104;
		facing=-1;
	}
	if(xpos<=28){
		xpos=29;
		facing=1;
	}

	ypos=89+sin(objBimsyminigame.timer*0.2)*2;

}

x=xpos;
y=ypos;

if(input(ord("Z"),PRESS)){
	if(place_meeting(x,y,objBimsyPeterhammer) && !dead){
	dead=1;
	playSound(sndBimPeter,1,1,0);
	objBimsymanager.wonlastminigame=1;
	}
}






