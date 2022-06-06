if live_call() return live_result;

event_inherited();

if(alive){
	xpos-=guyspd;
}else{
	xpos+=guyspd;
	ypos+=fallspd;
	fallspd+=objBimsymanager.gamespeed*0.2;
}

x=xpos;
y=ypos;

if(place_meeting(x,y,objBimsy360player)&&!collected){
	collected=1;
	objBimsy360player.items++;
	playSound(sndBimBite,0,1,0);
}
