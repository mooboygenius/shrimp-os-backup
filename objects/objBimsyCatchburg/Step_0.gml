if live_call() return live_result;

event_inherited();

if(!caught){
	ypos+=guyspd;
	guyspd+=objBimsymanager.gamespeed*0.02;
}

x=xpos;
y=ypos;

if(caught){
	xpos=objBimsyCatchguy.xpos+caughtoffset;
	ypos=objBimsyCatchguy.ypos-21;
}

if(!splatted){
	if(ypos>=120){
		splatted=1;
		playSound(sndBimSlimo,1,random_range(0.9,1.1),0);
		objBimsyCatchguy.guyfr=2;
	}
}

if(place_meeting(x,y,objBimsyCatchguy) && !caught){
	playSound(sndBimCork,1,random_range(0.9,1.1),0);
	caught=1;
	caughtoffset=xpos-objBimsyCatchguy.xpos;
	objBimsymanager.wonlastminigame=1;
	objBimsyCatchguy.guyfr=1;
}
