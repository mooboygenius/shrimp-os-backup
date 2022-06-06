if live_call() return live_result;

event_inherited();

bimfr=0;

fishtimer=irandom_range(60,90);
catchtimer=60;
caught=0;
bit=0;
ranoff=0;
fade=0;
fish=irandom_range(0,4);
if(objBimsymanager.shrimpmode){
	fish=5;	
}
fishtxt="";
switch(fish){
	case 0: fishtxt="I caught a... Ummmm... Idk what this is"; break;	
	case 1: fishtxt="I caught a red snapper! Aww snap!"; break;	
	case 2: fishtxt="I caught a coleacanth! Pretty cool ig."; break;	
	case 3: fishtxt="I caught a whale! Whale goddamn lol!"; break;	
	case 4: fishtxt="I caught a jellyfish! YEOUCH!!!!"; break;	
	case 5: fishtxt="As shrimple as that."; break;
	default: fishtxt="Erm... What the deuce"; break;
}
speechtxt="";
tr=1;
fishtxt=bimwraptext(fishtxt,55);

drawScript=function(x,y){
	draw_sprite(sprBimsyFishbg,0,0,0);
	if(caught){
		draw_sprite(sprBimsyFishing,bimfr,16,16-abs(sin(current_time*0.01)*2));
	}else{
		draw_sprite(sprBimsyFishing,bimfr,16,16);
	}
	
	
	if(bit && !caught && !ranoff){
		draw_sprite(sprBimsyFishexclam,fish,16+irandom_range(0,1),16+irandom_range(0,1));
	}
	
	if(caught){
		draw_sprite(sprBimsyFishes,fish,16,16+sin(current_time*0.01)*2);
		draw_sprite(sprBimsyFishspeechbub,0,0,0);
		draw_set_font(fntBimTiny);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_colour($734940);
		draw_text_ext(39,78,speechtxt,6,55);
		draw_sprite_ext(sprBimsyfade,fade,0,0,1,1,0,$e8fff5,1);
	}
}
