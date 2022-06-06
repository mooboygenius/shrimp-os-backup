if live_call() return live_result;

event_inherited();

objBimsymanager.wonlastminigame=1;

fallspd=0.0001;
bgpos=[64,64];
bgscale=0.2;
bimscale=3;
targetpos=[irandom_range(-70,70),irandom_range(-70,70)];

landed=0;

sped=0;
ysped=0;
guyspd=objBimsymanager.gamespeed*1.5;

playSound(sndBimMiss,1,1,0);


drawScript=function(x,y){
	draw_rectangle_color(0,0,128,128,$4f7d3b,$4f7d3b,$4f7d3b,$4f7d3b,0);
	draw_sprite_ext(sprBimsySkydivebg,0,bgpos[0],bgpos[1],bgscale,bgscale,0,-1,1);
	draw_sprite_ext(sprBimsySkydivetarget,0,bgpos[0]+targetpos[0]*bgscale,bgpos[1]+targetpos[1]*bgscale,bgscale,bgscale,0,-1,1);
	if(landed){
		if(objBimsymanager.wonlastminigame){
			draw_sprite_ext(sprBimsySkydivesleep,image_index,64,64,bimscale,bimscale,0,-1,1);
		}else{
			draw_sprite_ext(sprBimsySkydivehole,0,64,64,1,1,0,-1,1);
		}
	}else{
		draw_sprite_ext(sprBimsySkydivebimsy,image_index,64,64,bimscale,bimscale,0,-1,1);
	}
	
	
}
