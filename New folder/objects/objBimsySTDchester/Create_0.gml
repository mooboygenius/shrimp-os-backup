if live_call() return live_result;

event_inherited();

xpos=x;
ypos=y;
fr=0;
jiggle=0;
finger=0;
fingered=0;
popped=0;

alive=1;

drawScript=function(x,y){
	if(floor(current_time)%2==0){
		draw_sprite(sprBimsySTDshadow,0,xpos,ypos-3);	
	}
	if(alive){
		draw_sprite_ext(sprite_index,fr,xpos,ypos,1+jiggle,1-jiggle,0,-1,1);
	}else{
		draw_rectangle_colour(0,0,128,128,$2e1814,$2e1814,$2e1814,$2e1814,0);
		if(objBimsyminigame.timer>30){
			draw_sprite_ext(sprite_index,image_index,xpos+irandom(1),ypos+irandom(1),1,1,0,-1,1);
		}else{
			draw_sprite_ext(sprite_index,image_index,xpos,ypos,1,1,0,-1,1);
		}
		
	}
	
}
