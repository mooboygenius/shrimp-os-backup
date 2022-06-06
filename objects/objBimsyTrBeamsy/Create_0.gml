if live_call() return live_result;

event_inherited();

winmusic=objBimsymanager.remixintro;
losemusic=musBimsyGWLose;
nextmusic=sndBimCivhit;

scale=2;

image_speed=objBimsymanager.gamespeed;

addspeed=0.02;
mulspeed=1;

endcut="1-2";
stagenum=3;
endless=4;

drawScript=function(x,y){
	
	draw_sprite_ext(sprBimsyrbeamstatic,image_index,64,64,scale,scale,0,-1,1);
	draw_sprite_ext(sprBeamborder,0,64,64,scale,scale,0,-1,1);
	
	
}
