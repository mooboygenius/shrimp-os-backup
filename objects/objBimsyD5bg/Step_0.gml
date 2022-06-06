if live_call() return live_result;

event_inherited();

if(!picked){
	if(input(vk_right,PRESS)){
		picked=1;
		sel=2;
		hxgo=32
		hrotgo=-90
		sprposgo=[-20,84];
	}
	if(input(vk_left,PRESS)){
		picked=1;
		sel=1;
		hxgo=96
		hrotgo=90
		sprposgo=[44,148];
	}
}

if(picked && !sound){
	sound=1;
	if(sel=alivepos){
		objBimsymanager.wonlastminigame=1;	
		playSound(sndBimCorrect,1,1,0);
		playSound(sndBimGoat,1,1,0);
	}else{
		playSound(sndBimIncorrect,1,1,0);
		playSound(sndBimHLno,1,1,0);
	}
}

hx=lerp(hx,hxgo,0.2);
hrot=lerp(hrot,hrotgo,0.2);
sprpos[0]=lerp(sprpos[0],sprposgo[0],0.2);
sprpos[1]=lerp(sprpos[1],sprposgo[1],0.2);
