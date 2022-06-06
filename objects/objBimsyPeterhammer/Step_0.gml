if live_call() return live_result;

event_inherited();

slammed=input(ord("Z"),HOLD);

x=xpos;
y=ypos;


if(input(ord("Z"),PRESS)){
	playSound(sndBimPeterhammer,1,1,0);
	if(place_meeting(x,y,objBimsyPeterant) && !objBimsyPeterant.dead){
	objBimsyPeterant.dead=1;
	playSound(sndBimPeter,1,1,0);
	objBimsymanager.wonlastminigame=1;
	}
}

if(objBimsymanager.wonlastminigame){
	winy=lerp(winy,16,0.2) + sin(objBimsyminigame.timer);	
}

