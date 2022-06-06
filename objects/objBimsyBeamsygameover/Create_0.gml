if live_call() return live_result;

event_inherited();
i=0;
j=0;
h=0;

forkx=128;
forky=-128;
swayx=0;
swayy=0;
rot=0;
scale=1;

frame=0;

timer=120;

drawScript=function(x,y){
	//draw_rectangle_color(0,0,128,128,$4d352c,$4d352c,$4d352c,$4d352c,0);
	draw_sprite_ext(sprBimsyrunstatic,image_index,16,16,1,1,0,-1,1);
	draw_sprite_ext(sprBimminigameborder,9,0,0,1,1,0,-1,1);
	draw_sprite_ext(sprBimsyTrbeamsyfork,0,forkx+irandom(1),forky+irandom(1),1,1,0,-1,1);
	draw_sprite_ext(sprBimsyTrbeamsyblood,image_index,0,128,1,1,irandom_range(-2,2),-1,1);
	draw_sprite_ext(sprBimsyTrbeamsyshrimp,3,28+swayx,104+swayy,scale,scale,rot,-1,1);
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
}
