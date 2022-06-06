if live_call() return live_result;

event_inherited();

starttimer=irandom_range(120,180);
shoottimer=45;

exframe=0;
sound=0;
gunsout=0;
shot=0;
died=0;
waitscale=2;
expos=96;

objBimsymanager.wonlastminigame=0;


drawScript=function(x,y){
	draw_sprite(sprBimsyDuelbg,0,0,0);
	if(!died){
		draw_sprite_ext(sprBimsyDuelguy,gunsout,32,74,1,1,0,-1,1);
	}
	if(!shot){
		draw_sprite_ext(sprBimsyDuelguy,gunsout,96,74,-1,1,0,-1,1);
	}
	
	if(shot||died){
		draw_sprite_ext(sprBimsyDuelExplosion,exframe,expos,74,1,1,0,-1,1);
	}
	
	if(starttimer>0){
		draw_sprite_ext(sprBimsyDuelwait,0,64,32,1,1,0,-1,1);
	}else{
		draw_sprite_ext(sprBimsyDuelwait,1,64,32,waitscale,waitscale,0,-1,1);
	}
	
}
