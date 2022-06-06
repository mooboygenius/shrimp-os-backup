if live_call() return live_result;

event_inherited();

image_speed=objBimsymanager.gamespeed;

hit=0;
objBimsymanager.wonlastminigame=0;
fade=0;
bally=15;
putt=0;
holesize=0;
fr=0;

if(objBimsymanager.shrimpmode){
	fr=1;	
}

drawScript=function(x,y){
	draw_sprite(sprBimsyGolfbg,0,0,0);
	draw_sprite(sprite_index,image_index,0,0);
	if(hit && objBimsymanager.wonlastminigame){
		draw_sprite_ext(sprBimsyfade,fade,0,0,1,1,0,$e8fff5,1);
		draw_set_colour($e8fff5);
		draw_point(92,bally);
	}
	if(putt){
		draw_sprite_ext(sprBimGolfholeinone,fr,irandom_range(64,65),irandom_range(40,41),holesize,holesize,0,-1,1);
	}
}
