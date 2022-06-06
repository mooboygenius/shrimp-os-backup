if live_call() return live_result;

event_inherited();

winmusic=musBimsyGWWin;
losemusic=musBimsyGWLose;
nextmusic=musBimsyGWNext;

swayx=0;
swayy=0;

image_speed=objBimsymanager.gamespeed;

addspeed=0.02;
mulspeed=1;

endcut="1-2";
stagenum=3;
endless=1;

drawScript=function(x,y){
	draw_sprite_tiled(sprBimsyTrGotchibg,0,current_time*0.02,current_time*0.02);
	draw_sprite(sprBimsyTrGotchi,0,swayx,swayy);
	draw_set_font(fntGotchi);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_colour($403528);
	if(manager.bimscore<=9){
		draw_text(66+swayx,39+swayy,"00"+string(manager.bimscore));
	}else if(manager.bimscore>=100){
		draw_text(66+swayx,39+swayy,string(manager.bimscore));
	}else{
		draw_text(66+swayx,39+swayy,"0"+string(manager.bimscore));
	}
	
	if(timer<=120){
		draw_sprite(sprBimsyTrGotchiTransition,image_index,swayx,swayy);
	}else{
		if(manager.wonlastminigame){
			draw_sprite(sprBimsyTrGotchiWin,image_index,swayx,swayy);
		}else{
			if(manager.hp==0){
				draw_sprite(sprBimsyTrGotchiDead,image_index,swayx,swayy);
			}else{
				draw_sprite(sprBimsyTrGotchiLose,image_index,swayx,swayy);
			}
			
		}
		
	}
	
	if(manager.hp<=3){
		draw_sprite(sprBimsyTrGotchipoop,0,swayx+32,swayy+75+(sin(10+ timer*0.1)));
	}
	if(manager.hp<=2){
		draw_sprite(sprBimsyTrGotchipoop,0,swayx+86,swayy+74+(sin(20+ timer*0.1)));
	}
	if(manager.hp<=1){
		draw_sprite(sprBimsyTrGotchipoop,0,swayx+30,swayy+61+(sin(30+ timer*0.1)));
	}
	if(manager.hp<=0){
		draw_sprite(sprBimsyTrGotchipoop,0,swayx+88,swayy+61+(sin(40+ timer*0.1)));
	}
	
}
