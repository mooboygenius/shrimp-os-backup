if live_call() return live_result;

event_inherited();

winmusic=musBimsyWin;
losemusic=musBimsyLose;
nextmusic=musBimsyNext;

bgx=0;
item=irandom_range(0,4);
itemy=0;
itemspd=-2;
foodscale=0;
swirlscale=0;

image_speed=objBimsymanager.gamespeed;

addspeed=0.035;
mulspeed=1;

endcut="1-2";
stagenum=0;
endless=0;

drawScript=function(x,y){
	draw_sprite_tiled(sprBimsyTrbg,0,bgx,0);
	
	
	draw_sprite(sprBimsyTrsign,0,0,0);
	draw_set_font(fntMar);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_colour($e8fff5);
	if(manager.bimscore<=9){
		draw_text(33,17,"00"+string(manager.bimscore));
	}else if(manager.bimscore>=100){
		draw_text(33,17,string(manager.bimscore));
	}else{
		draw_text(33,17,"0"+string(manager.bimscore));
	}
	
	draw_sprite_ext(sprBimsyTrswirl,manager.wonlastminigame,96,48,swirlscale,swirlscale,timer*5,-1,1);
	
	
	
	if(timer<=120){
		draw_sprite(sprBimsyTridle,image_index,0,0);
	}else{
			
		if(manager.wonlastminigame){
			draw_sprite(sprBimsyTrhappy,image_index,0,0);
		}else{
			draw_sprite(sprBimsyTrsad,image_index,0,0);
		}
		
	}
	
	if(manager.wonlastminigame){
			draw_sprite_ext(sprBimsyTrfoodgood,item,96,48+itemy,foodscale,foodscale,sin(timer*0.1)*8,-1,1);
			if(timer<=120){
				draw_sprite(sprBimsyTrcartfront,image_index,0,0);
			}else{
				draw_sprite(sprBimsyTrcartfront,0,0,0);
			}
			
		}else{
			draw_sprite_ext(sprBimsyTrfoodbad,item,96,48,foodscale,foodscale,sin(timer*0.1)*8,-1,1);
		}
	
	//if(manager.hp<=3){
	//	draw_sprite(sprBimsyTrGotchipoop,0,swayx+32,swayy+75+(sin(10+ timer*0.1)));
	//}
	//if(manager.hp<=2){
	//	draw_sprite(sprBimsyTrGotchipoop,0,swayx+86,swayy+74+(sin(20+ timer*0.1)));
	//}
	//if(manager.hp<=1){
	//	draw_sprite(sprBimsyTrGotchipoop,0,swayx+30,swayy+61+(sin(30+ timer*0.1)));
	//}
	//if(manager.hp<=0){
	//	draw_sprite(sprBimsyTrGotchipoop,0,swayx+88,swayy+61+(sin(40+ timer*0.1)));
	//}
	
	if(objBimsymanager.hp>=1){
		draw_sprite(sprBimsyTrbeamsyhearts,image_index,1,111);
	}
	if(objBimsymanager.hp>=2){
		draw_sprite(sprBimsyTrbeamsyhearts,image_index+1,17,111);
	}
	if(objBimsymanager.hp>=3){
		draw_sprite(sprBimsyTrbeamsyhearts,image_index+2,93,111);
	}
	if(objBimsymanager.hp>=4){
		draw_sprite(sprBimsyTrbeamsyhearts,image_index+3,110,111);
	}
	
}
