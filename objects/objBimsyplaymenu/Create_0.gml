if live_call() return live_result;

event_inherited();

canpress=0;

xpos=x;
ypos=y;

menucol=0;
menucolg=0;
menupos=[0,0,0,0,0];
menuposg=objBimsymanager.menuposg;
menumax=[1,4,6,3,4];
colmax=objBimsymanager.colsunlocked;


ticker="This shits far out, man!";
tickerx=128;
tickercol=$83eeff;

updatetext=1;
tex="";

drawScript=function(x,y){
	draw_sprite_tiled(sprBimbg,0,current_time*0.01,current_time*0.01);
	draw_sprite_ext(sprBimsyPlaylogo,0,64,16,+cos(current_time*0.003),1,sin(current_time*0.001)*60,-1,1);
	
	draw_sprite(sprBimsymenulineH,image_index,0,32);	
	draw_sprite(sprBimsymenulineV,image_index,16+menucol*20,0);	
	for(var i=0; i<=menumax[0]; i++){
		draw_sprite(sprBimsyIconPlay,i,16,32+i*19-menupos[0]*19);	
	}
	for(var i=0; i<=menumax[1]; i++){
		draw_sprite(sprBimsyIconLevels,i,36,32+i*19-menupos[1]*19);
		if(i>objBimsymanager.stagesdone){
			draw_sprite(sprBimsyIconLevelslocked,i,36,32+i*19-menupos[1]*19);
		}
	}
	if(colmax>=2){
		for(var i=0; i<=menumax[2]; i++){
			draw_sprite(sprBimsyIconCharacter,i,56,32+i*19-menupos[2]*19);	
			if(!objBimsymanager.unlockedchars[i]){
				draw_sprite(sprBimsyIconCharacterlocked,i,56,32+i*19-menupos[2]*19);
			}
		}
	}else{
		draw_sprite(sprBimsyIconLocked,0,56,32);	
	}
	if(colmax>=3){
		for(var i=0; i<=menumax[3]; i++){
			draw_sprite(sprBimsyIconMusic,i,76,32+i*19-menupos[3]*19);
			if(!objBimsymanager.unlockedmusic[i]){
				draw_sprite(sprBimsyIconMusiclocked,i,76,32+i*19-menupos[3]*19);
			}
		}
	}else{
		draw_sprite(sprBimsyIconLocked,0,76,32);	
	}
	if(colmax>=4){
		for(var i=0; i<=menumax[4]; i++){
			draw_sprite(sprBimsyIconMode,i,96,32+i*19-menupos[4]*19);	
		}
	}else{
		draw_sprite(sprBimsyIconLocked,0,96,32);	
	}
	
	draw_rectangle_colour(0,108,128,128,$2e1814,$2e1814,$2e1814,$2e1814,0);
	draw_set_font(fntSilver);
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	draw_set_colour(tickercol);
	draw_text(tickerx,124,ticker);
}
