if live_call() return live_result;

event_inherited();

if(alive){
	jiggle=lerp(jiggle,0,0.2);

	if((input(ord("Z"),PRESS)||input(vk_right,PRESS)) && !objBimsySTDbullet.fired){
		fr=!fr;
		jiggle=0.2;
		playSound(sndBimGun,1,random_range(0.8,1.2),0);
		objBimsySTDbullet.fired=1;
		
	}
	

}

x=xpos;
y=ypos;

if(place_meeting(x,y,objBimsySTDenemy)&&alive&&objBimsySTDenemy.alive){
	alive=0;
	playSound(sndBimBreak,0,1,0);
	sprite_index=sprBimsySTDchesterdead;
}

if(!alive){
	xpos=lerp(xpos,64,0.2);	
	ypos=lerp(ypos,70,0.2);	
	if(objBimsyminigame.timer<=30 && !popped){
		sprite_index=sprBimsySTDchesterpop;	
		popped=1;
		playSound(sndBimCork,1,1,0);
	}
}

if(finger&&!fingered){
	fingered=1;
	jiggle=0.5;
	fr=2;
}

