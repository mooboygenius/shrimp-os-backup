if live_call() return live_result;

event_inherited();

xpos=x;
ypos=y;

facing=1;
dead=0;

spd=objBimsymanager.gamespeed*2;


drawScript=function(x,y){
	if(!dead){
		draw_sprite_ext(sprite_index,image_index,xpos,ypos,facing,1,0,-1,1);
	}else{
		draw_sprite_ext(sprBimsyPeterantdead,image_index,xpos,ypos,facing,1,0,-1,1);
	}
	
}
