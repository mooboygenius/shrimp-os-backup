if live_call() return live_result;

event_inherited();

xpos-=guyspd;

x=xpos;
y=ypos;

if(place_meeting(x,y,objBimsyDeadshot) && objBimsyDeadshot.fr<4 && alive){
	alive=0;
	objBimsyDeadjules.kills++;
	playSound(sndBimSlimo,1,1,0);
}
