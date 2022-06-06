if live_call() return live_result;

event_inherited();

ypos+=guyspd;

x=xpos;
y=ypos;

if(place_meeting(x,y,objBimsyAvoidcat) && !objBimsyAvoidcat.dead){
	objBimsyAvoidcat.dead=1;
	playSound(sndBimsyCreatures,1,1,0);
	objBimsymanager.wonlastminigame=0;
	objBimsyAvoidcat.sprite_index=sprBimsyAvoidcatdead;
}
