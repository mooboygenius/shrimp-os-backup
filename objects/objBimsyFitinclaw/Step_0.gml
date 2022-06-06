if live_call() return live_result;

if input(mb_left) show_debug_message(concat("claw x: ", x, "  y: ", y));

event_inherited();

if(!landed){
	if(input(vk_left,PRESS)){
		facing=-1;
		playSound(sndBimsySkid,1,random_range(0.9,1.1),0);
	}
	if(input(vk_right,PRESS)){
		facing=1;
		playSound(sndBimsySkid,1,random_range(0.9,1.1),0);
	}

	sped=lerp(sped,facing*guyspd,0.3);
	ypos+=downspd;
	
	if(ypos>=107){
		landed=1;
		if(!objBimsyFitinhole.ploinked){
			objBimsyFitinhole.ploinked=1;
			if(place_meeting(x,y,objBimsyFitinhole)){
				objBimsyFitinhole.fr=1;
				fr=1;
				objBimsymanager.wonlastminigame=1;
				playSound(sndBimCork,1,random_range(0.9,1.1),0);
				playSound(sndBimBaby,1,random_range(0.4,0.6),0);
			}else{
				playSound(sndBimHop,1,random_range(0.9,1.1),0);
			}
		}
	}

}else{
	sped=lerp(sped,0,0.3);
	ypos-=downspd;
}

xpos+=sped;
xpos=clamp(xpos,27,102);
if(xpos==27){
	xpos++;
	facing=1;	
}
if(xpos==102){
	xpos--;
	facing=-1;	
}

x=xpos;
y=ypos;
