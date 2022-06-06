if live_call() return live_result;

if input(mb_left) show_debug_message(concat("hole x: ", x, "  y: ", y, " (", xpos, ", ", ypos, ")"));

event_inherited();

x=xpos;
y=ypos;

if(objBimsyFitinclaw.landed && !ploinked){
	ploinked=1;
	if(place_meeting(x,y,objBimsyFitinclaw)){
		objBimsyFitinclaw.fr=1;
		fr=1;
		objBimsymanager.wonlastminigame=1;
		playSound(sndBimCork,1,random_range(0.9,1.1),0);
		playSound(sndBimBaby,1,random_range(0.4,0.6),0);
	}else{
		playSound(sndBimHop,1,random_range(0.9,1.1),0);
	}
}
