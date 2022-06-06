if live_call() return live_result;

event_inherited();

fr=objBimsymanager.shrimpmode;
xs=0;
ys=0;
shake=0;
smash=0;
hits=0;
won=0;
fade=0;
time=0.1;
jiggle=0;
objBimsymanager.wonlastminigame=0;

drawScript=function(x,y){
	draw_sprite(sprBimsyrockbg,0,0,0);
	if(won){
		draw_sprite_ext(sprBimsyrockstatue,fr,64+xs,64+ys+cos(objBimsyminigame.timer*0.25)*2,sin(objBimsyminigame.timer*0.05)*(1+jiggle),1-jiggle,0,-1,1);
	}
	if(hits<=4){
		draw_sprite(sprBimsyrock,hits,xs,ys);
	}
	draw_sprite(sprBimsyrockhammer,smash,xs,ys);
	
	draw_set_font(fntBimTiny);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	
	
	if(won){
		draw_sprite_ext(sprBimsyfade,fade,0,0,1,1,0,$e8fff5,1);
	}else{
		bimoutlinetext(64+xs,19+ys,string(time),$e8fff5,$211f1b);
	}
	
}
