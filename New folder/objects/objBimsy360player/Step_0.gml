if live_call() return live_result;

event_inherited();

if(input(ord("Z"),PRESS) && !jumping){
	jumping=1;
	yspd=-5*objBimsymanager.gamespeed;
	sprite_index=sprBimsy360playerjump;
	playSound(sndBimHop,1,1,0);
		
}

if(jumping){
	ypos+=yspd;
	yspd+=objBimsymanager.gamespeed*0.35;
	rot+=objBimsymanager.gamespeed*10;
	if(ypos>=71){
		ypos=71;
		jumping=0;
		rot=0;
		sprite_index=sprBimsy360player;
		playSound(sndBimCork,1,1,0);
	}
	if(ypos<=16){
		ypos=17;
		yspd=0;
	}
}

if(items>=2 && !won){
	won=1;	
	playSound(sndBimHit,1,1,0);
	objBimsymanager.wonlastminigame=1;
}

if(won){
	xpos+=objBimsymanager.gamespeed*2;	
}


x=xpos;
y=ypos;

if(place_meeting(x,y,objBimsy360item) && !objBimsy360item.collected){
	objBimsy360item.collected=1;
	items++;
	playSound(sndBimBite,0,1,0);
}

if(place_meeting(x,y,objBimsy360item2) && !objBimsy360item2.collected){
	objBimsy360item2.collected=1;
	items++;
	playSound(sndBimBite,0,1,0);
}


