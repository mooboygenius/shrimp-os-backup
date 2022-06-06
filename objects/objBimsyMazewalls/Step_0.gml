if live_call() return live_result;

event_inherited();

x=0;
y=0;

if(place_meeting(x,y,objBimsyMazecursor) && !objBimsyMazecursor.dead && !objBimsyMazecursor.won){
		objBimsyMazecursor.dead=1;
		playSound(sndBimBanshee,1,1,0);
		objBimsymanager.wonlastminigame=0;
	}
