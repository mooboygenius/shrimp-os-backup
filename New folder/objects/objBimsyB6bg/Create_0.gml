if live_call() return live_result;

event_inherited();

bimfr=0;

fishtimer=irandom_range(90,120);
catchtimer=45;
caught=0;
bit=0;
ranoff=0;
fade=0;
fish=irandom_range(0,4);
phonerot=0;
butterfly=0;
ring=0;

drawScript=function(x,y){
	draw_sprite(sprBimsyPhonebg,0,16,16);
	draw_sprite(sprBimsyPhoneguy,bimfr,16,16);
	draw_sprite_ext(sprBimsyPhonereceiver,0,16+65,16+55,1,1,sin(phonerot)*15,-1,1);
	
	if(caught){
		draw_sprite_tiled(sprBimsyPhonerainbowbg,0,objBimsyminigame.timer,objBimsyminigame.timer);
		draw_sprite(sprBimsyPhonesparklesbg,image_index,16,16);
		draw_sprite(sprBimsyPhonedance,image_index/2,16,16);
	}
}
