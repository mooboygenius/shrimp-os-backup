if live_call() return live_result;

event_inherited();

timer=240;
addedscore=0;
splashed=0;

winmusic=musBimsyGWWin;
losemusic=musBimsyGWLose;
nextmusic=musBimsyGWNext;

manager=objBimsymanager;

addspeed=0.02;
mulspeed=manager.mulspeed;

endcut="1-2";
stagenum=0;
endless=0;


drawScript=function(x,y){
	draw_sprite(sprBimsywindow,0,0,0);
	draw_set_font(fntSilver);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_colour(c_black);
	draw_text(5,5,"score: "+string(manager.bimscore));
	draw_text(5,18,"lives: "+string(manager.hp));
}

