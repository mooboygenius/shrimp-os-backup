if live_call() return live_result;

event_inherited();

xpos=objBimsyDeadjules.xpos;
ypos=objBimsyDeadjules.ypos;

x=xpos;
y=ypos;

if(input(ord("Z"),PRESS) && fr>=4 && !objBimsyDeadjules.won){
	fr=0;
	playSound(sndBimGun,1,random_range(0.9,1.1),0);
}

fr=clamp(fr+objBimsymanager.gamespeed*0.3,0,4);

if(place_meeting(x,y,objBimsyDeadworm) && fr<4){
	var w= instance_place(x,y,objBimsyDeadworm);
	if(w.alive){
		w.alive=0;
		objBimsyDeadjules.kills++;
		playSound(sndBimSlimo,1,1,0);
	}
}
