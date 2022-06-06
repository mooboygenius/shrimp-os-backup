if live_call() return live_result;

event_inherited();

winmusic=musMarishaWin;
losemusic=musMarishaLose;
nextmusic=musMarishaNext;

sway=0;
beamsyx=0;

image_speed=objBimsymanager.gamespeed;

addspeed=0.045;
mulspeed=1;

fails=[sprBimsytrMarishafail1,sprBimsytrMarishafail2,sprBimsytrMarishafail3];
wins=[sprBimsytrMarishawinscr1,sprBimsytrMarishawinscr2,sprBimsytrMarishawinscr3];
screen=irandom_range(0,2);

endcut="3-2";
stagenum=2;
endless=0;

drawScript=function(x,y){
	draw_sprite_tiled(sprBimsyTrMarishabg,0,timer*0.1,timer*0.1);
	
	
	
	draw_set_font(fntMar);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_colour($e8fff5);
	
	if(manager.bimscore<=9){
		draw_text(89,50,"00"+string(manager.bimscore));
	}else if(manager.bimscore>=100){
		draw_text(89,50,string(manager.bimscore));
	}else{
		draw_text(89,50,"0"+string(manager.bimscore));
	}
	
	if(timer<=120){
		draw_sprite(sprBimsytrMarishanext,0,64,32);
		draw_sprite(sprBimsytrMarishaidle,image_index,0,0);
	}else{
		
		if(manager.wonlastminigame){
			draw_sprite(wins[screen],image_index/2,64,32);
			draw_sprite(sprBimsytrMarishawin,image_index,0,0);
		}else{
			draw_sprite(fails[screen],image_index/2,64,32);
			draw_sprite(sprBimsytrMarishalose,image_index,0,0);
			
		}
		
	}
	
	if(manager.hp>=1){
		draw_sprite(sprBimsytrMarishalife,image_index,68,8);
	}
	if(manager.hp>=2){
		draw_sprite(sprBimsytrMarishalife,image_index+1,82,6);
	}
	if(manager.hp>=3){
		draw_sprite(sprBimsytrMarishalife,image_index+2,96,7);
	}
	if(manager.hp>=4){
		draw_sprite(sprBimsytrMarishalife,image_index+3,110,9);
	}
	
}
