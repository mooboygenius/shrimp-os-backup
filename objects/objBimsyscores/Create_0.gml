if live_call() return live_result;

event_inherited();


xpos=x;
ypos=y;

canpress=0;
scrolly=128;

scores=[
"Stage 1- "+string(objBimsymanager.highscores[0]),
"Stage 2- "+string(objBimsymanager.highscores[1]),
"Stage 3- "+string(objBimsymanager.highscores[2]),
"Stage 4- "+string(objBimsymanager.highscores[3]),
"Stage 5- "+string(objBimsymanager.highscores[4])
];

switch(irandom_range(0,2)){
	case 0:
		sprite_index=sprBimsyScoresbg1;
		objBimsymanager.bimmusic=playSound(musBimsyscores1,1,1,1);
	break;
	case 1:
		sprite_index=sprBimsyScoresbg2;
		objBimsymanager.bimmusic=playSound(musBimsyscores2,1,1,1);
	break;
	case 2:
		sprite_index=sprBimsyScoresbg3;
		objBimsymanager.bimmusic=playSound(musBimsyscores3,1,1,1);
	break;
}



drawScript=function(x,y){
	draw_sprite_tiled(sprite_index,image_index,current_time*0.01,current_time*0.01);

	draw_set_font(fntScores);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	for(var i=0; i<array_length(scores); i++){
		bimoutlinetext(3+abs(sin(current_time*0.01+i*10)*3),27+16*i,scores[i],$e8fff5,$211f1b);
	}
	
	draw_sprite(sprBimsyScoreslogo,0,0,0);
	draw_sprite(sprBimsyCreditsleave,0,0,128);
}
