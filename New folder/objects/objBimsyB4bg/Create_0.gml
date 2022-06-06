if live_call() return live_result;

event_inherited();

bites=0;
biting=0;
content=0;
fade=0;

drawScript=function(x,y){
	draw_sprite(sprBimsyHotdogbg,0,0,0);
	if(content){
		draw_sprite(sprBimsyHotdogguydone,image_index,0,0);	
		draw_sprite_ext(sprBimsyfade,fade,0,0,1,1,0,$e8fff5,1);
	}else{
		if(biting){
			draw_sprite(sprBimsyHotdogguyclosed,image_index,0,0);	
		}else{
			draw_sprite(sprBimsyHotdogguyopen,image_index,0,0);	
		}
	}
	
	if(bites==0){
		draw_sprite(sprBimsyHotdog1,image_index,0,0);	
	}
	if(bites==1){
		draw_sprite(sprBimsyHotdog2,image_index,0,0);	
	}
	if(bites==2){
		draw_sprite(sprBimsyHotdog3,image_index,0,0);	
	}
	
	
}
