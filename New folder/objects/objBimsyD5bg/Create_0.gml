if live_call() return live_result;

event_inherited();

objBimsymanager.wonlastminigame=0;	

hrot=0;
hrotgo=0;
hx=64;
hxgo=64;
picked=0;
sel=1;
sound=0;

alivething=irandom_range(0,3);
deadthing=irandom_range(0,4);
sprs=[0,0];
sprf=[0,0];
sprpos=[15,112];
sprposgo=[15,112];

if(objBimsymanager.shrimpmode){
	alivething=4;
}

alivepos=irandom_range(1,2);
if(alivepos==1){
	sprs=[sprBimsyAliveanimals,sprBimsyAlivedead];
	sprf=[alivething,deadthing];
}else{
	sprs=[sprBimsyAlivedead,sprBimsyAliveanimals];
	sprf=[deadthing,alivething]
}

drawScript=function(x,y){
	draw_sprite(sprBimsyAlivebg,0,0,0);
	draw_sprite_ext(sprBimsyAlivehand,0,hx,64,1,1,hrot,-1,1);
	draw_sprite_ext(sprs[0],sprf[0],sprpos[0],64,1,1,0,-1,1);
	draw_sprite_ext(sprs[1],sprf[1],sprpos[1],64,1,1,0,-1,1);
	
	if(sound){
		draw_sprite_ext(sprBimsyAliveyea,objBimsymanager.wonlastminigame,64+irandom_range(0,1),96+irandom_range(0,1),1,1,0,-1,1);
	}
	
}
