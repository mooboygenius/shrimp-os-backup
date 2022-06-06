if live_call() return live_result;

event_inherited();

winmusic=musSecWin;
losemusic=musSecLose;
nextmusic=musSecNext;

sway=0;
beamsyx=0;
secx=0;
secy=0;

image_speed=objBimsymanager.gamespeed;

addspeed=0.04;
mulspeed=1;

endcut="2-2";
stagenum=1;
endless=0;

drawScript=function(x,y){
	draw_sprite(sprBimsyTrSecbg,0,0,0);
	
	if(timer<=120){
		draw_sprite_ext(sprBimsyTrBeamsyidle,image_index,beamsyx,0,1,1,0,-1,1);
		draw_sprite_ext(sprBimsyTrSecglass,0,0,0,1,1,0,-1,1);
		draw_sprite_ext(sprBimsyTrSecidle,image_index,secx,secy,1,1,sway,-1,1);
		draw_sprite_ext(sprBimsyTrSecref,0,0,0,1,1,0,-1,1);
		
	}else{
		if(objBimsymanager.wonlastminigame){
			draw_sprite_ext(sprBimsyTrBeamsyhappy,image_index,beamsyx,0,1,1,0,-1,1);
			draw_sprite_ext(sprBimsyTrSecglass,0,0,0,1,1,0,-1,1);
			draw_sprite_ext(sprBimsyTrSechappy,image_index,secx,secy,1,1,sway,-1,1);
			draw_sprite_ext(sprBimsyTrSecref,0,0,0,1,1,0,-1,1);
		}else{
			draw_sprite_ext(sprBimsyTrBeamsyblow,image_index,beamsyx,0,1,1,0,-1,1);
			draw_sprite_ext(sprBimsyTrSecglass,0,0,0,1,1,0,-1,1);
			draw_sprite_ext(sprBimsyTrSecfail,image_index,secx,secy,1,1,sway,-1,1);
			draw_sprite_ext(sprBimsyTrSecref,0,0,0,1,1,0,-1,1);
		}
	}
	
	
	draw_set_font(fntSecSign);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_colour($41b5f0);
	if(manager.bimscore<=9){
		draw_text(32+beamsyx,95,"00"+string(manager.bimscore));
	}else if(manager.bimscore>=100){
		draw_text(32+beamsyx,95,string(manager.bimscore));
	}else{
		draw_text(32+beamsyx,95,"0"+string(manager.bimscore));
	}
	
	if(manager.hp>=1){
		draw_sprite(sprBimsyTrFlower,image_index,-4,96);
	}
	if(manager.hp>=2){
		draw_sprite(sprBimsyTrFlower,image_index+1,11,96);
	}
	if(manager.hp>=3){
		draw_sprite(sprBimsyTrFlower,image_index+2,26,96);
	}
	if(manager.hp>=4){
		draw_sprite(sprBimsyTrFlower,image_index+3,41,96);
	}
	
	
}
