if live_call() return live_result;

event_inherited();

if(fired){
	xpos+=guyspd;
}

x=xpos;
y=ypos;

if(place_meeting(x,y,objBimsySTDenemy) && objBimsySTDenemy.alive && fired){
	objBimsySTDenemy.alive=0;
	playSound(sndBimSlimo,1,1,0);
	objBimsymanager.wonlastminigame=1;
	objBimsySTDchester.finger=1;
}
