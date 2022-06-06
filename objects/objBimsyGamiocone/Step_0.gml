if live_call() return live_result;

event_inherited();

xpos-=guyspd;

x=xpos;
y=ypos;

if(place_meeting(x,y,objBimsyGamiokart) && !objBimsyGamiokart.dead){
	objBimsyGamiokart.dead=1;
	objBimsyGamiokart.sprite_index=sprBimsyGamionuke;
	playSound(sndBimExplosion,1,1,0);
	playSound(objBimsyD8bg.lose[irandom_range(0,3)],1,1,0);
	objBimsymanager.wonlastminigame=0;
}


