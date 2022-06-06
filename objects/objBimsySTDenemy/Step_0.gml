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

if(place_meeting(x,y,objBimsySTDbullet) && alive && objBimsySTDbullet.fired){
	alive=0;
	playSound(sndBimSlimo,1,1,0);
	objBimsymanager.wonlastminigame=1;
	objBimsySTDchester.finger=1;
}

if(place_meeting(x,y,objBimsySTDchester)&&alive&&objBimsySTDchester.alive){
	objBimsySTDchester.alive=0;
	playSound(sndBimBreak,0,1,0);
	objBimsySTDchester.sprite_index=sprBimsySTDchesterdead;
}
