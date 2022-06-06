if live_call() return live_result;

event_inherited();

if(timer>0){
	if(timer==240){
		if(manager.playmusic){
			manager.bimmusic=playSound(music,1,manager.gamespeed,0);	
		}else{
			manager.bimmusic=playSound(manager.remixsong[manager.songpointer],1,manager.gamespeed,0);
			manager.songpointer++;
			if(manager.songpointer>=array_length(manager.remixsong)){
				manager.songpointer=0;
			}
		}
		
	}
	timer-=manager.gamespeed;
	
	if(timer<=0){
		if(manager.notransition){
			objBimsyBeamsy.scale=0.8;
			
			manager.gamespeed+=0.02;
			manager.gamespeed*=manager.mulspeed;
			if(manager.wamiugi){
				manager.gamespeed+=random_range(-0.3,0.4);
			}
			manager.deckpointer++;
			if(manager.deckpointer>=array_length(manager.minigamedeck)){
				manager.deckpointer=0;
				bimsyscrambledeck();
			}
			
			if(manager.wonlastminigame){
				playSound(manager.winv[irandom_range(0,array_length(manager.winv)-1)],1,1,0);
				objBimsyBeamsy.frame=irandom_range(0,3);
			}else{
				objBimsyBeamsy.frame=irandom_range(4,7);
				manager.hp--;
				if(manager.hp==1){
					playSound(manager.oneleftv,1,1,0);
				}else{
					if(manager.hp>0){
						playSound(manager.losev[irandom_range(0,array_length(manager.losev)-1)],1,1,0);
					}
				}
			}
			if(manager.hp<=0){
				playSound(sndBimBreak,0,1,0);
				playSound(sndVBeamsyGnaw,0,1,0);
				audio_stop_sound(manager.bimmusic);
				manager.bimmusic=playSound(manager.remixriff,1,manager.gamespeed,0);
				createWindowInstance(0,0,depth+1,objBimsyBeamsygameover,parentWindow);
				instance_destroy(objBimsyBeamsy);
				instance_destroy(self);
			}else{
				manager.bimscore++;
				manager.wonlastminigame=0;
				createWindowInstance(0,0,depth,manager.minigamedeck[manager.deckpointer],parentWindow);
			}
			
			
		
		//end beamsymode
		}else{
			createWindowInstance(0,0,depth+10,manager.transition,parentWindow);
		}
		for(var i=0; i<ds_list_size(elements); i++){
			instance_destroy(ds_list_find_value(elements,i))	
		}
		instance_destroy(self);
		
	}
}

if(timer<90 && !ticks[0]){
	audio_play_sound(sndBimTimer,0,0);	
	ticks[0]=1;
}

if(timer<60 && !ticks[1]){
	audio_play_sound(sndBimTimer,0,0);	
	ticks[1]=1;
}

if(timer<30 && !ticks[2]){
	audio_play_sound(sndBimTimer,0,0);	
	ticks[2]=1;
}

