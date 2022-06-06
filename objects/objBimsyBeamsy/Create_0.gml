if live_call() return live_result;

event_inherited();
i=0;
j=0;
h=0;

swayx=0;
swayy=0;
rot=0;
scale=1;

frame=0;

drawScript=function(x,y){
	draw_sprite_ext(sprBimsyTrbeamsyshrimp,frame,28+swayx,104+swayy,scale,scale,rot,-1,1);
	draw_sprite_ext(sprBimsyTrBeamsyscreen,0,64,0,1,1,0,-1,1);
	draw_set_font(fntCut);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_colour($83eeff);
	if(objBimsymanager.bimscore<=9){
		draw_text(64,9,"00"+string(objBimsymanager.bimscore));
	}else if(objBimsymanager.bimscore>=100){
		draw_text(64,9,string(objBimsymanager.bimscore));
	}else{
		draw_text(64,9,"0"+string(objBimsymanager.bimscore));
	}
	
	if(objBimsymanager.hp>=1){
		draw_sprite(sprBimsyTrbeamsyhearts,image_index,1,1);
	}
	if(objBimsymanager.hp>=2){
		draw_sprite(sprBimsyTrbeamsyhearts,image_index+1,17,1);
	}
	if(objBimsymanager.hp>=3){
		draw_sprite(sprBimsyTrbeamsyhearts,image_index+2,93,1);
	}
	if(objBimsymanager.hp>=4){
		draw_sprite(sprBimsyTrbeamsyhearts,image_index+3,110,1);
	}
}
