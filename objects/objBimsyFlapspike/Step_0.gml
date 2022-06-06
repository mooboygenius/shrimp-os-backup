if live_call() return live_result;

event_inherited();

xpos-=guyspd;
rot+=guyspd*5;

x=xpos;
y=ypos;

if(place_meeting(x,y,objBimsyFlapbird) && !objBimsyFlapbird.dead){
	objBimsyFlapbird.yspd=-2;
	objBimsyFlapbird.dead=1;
	playSound(sndBimSlimo,1,1,0);
	objBimsymanager.wonlastminigame=0;
}
