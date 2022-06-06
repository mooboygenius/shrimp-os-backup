if live_call() return live_result;

event_inherited();

if(timer>0){
	if(timer==240){
		
		manager.gamespeed+=addspeed;
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
			if(manager.bimscore==0){
				playSound(manager.startv,1,1,0);
			}else{
				playSound(manager.winv[irandom_range(0,array_length(manager.winv)-1)],1,1,0);
			}
			
			if(manager.playmusic){
				manager.bimmusic=playSound(winmusic,1,manager.gamespeed,0);
			}else{
				if(objBimsymanager.notransition){
					manager.bimmusic=playSound(winmusic,1,manager.gamespeed,0);
				}else{
					manager.bimmusic=playSound(manager.remixsong[manager.songpointer],1,manager.gamespeed,0);
					manager.songpointer++;
					if(manager.songpointer>=array_length(manager.remixsong)){
						manager.songpointer=0;
					}
				}
				
			}
		}else{
			if(manager.playmusic){
				manager.bimmusic=playSound(losemusic,1,manager.gamespeed,0);
			}else{
				manager.bimmusic=playSound(manager.remixsong[manager.songpointer],1,manager.gamespeed,0);
				manager.songpointer++;
				if(manager.songpointer>=array_length(manager.remixsong)){
					manager.songpointer=0;
				}
			}
			manager.hp--;
			if(manager.hp==1){
				playSound(manager.oneleftv,1,1,0);
			}else{
				playSound(manager.losev[irandom_range(0,array_length(manager.losev)-1)],1,1,0);
			}
		}		
	}
	timer-=manager.gamespeed;
	if(timer<=120 && !addedscore){
		if(manager.hp<=0){
			playSound(sndBimCuica,1,1,0);
			audio_stop_sound(manager.bimmusic);
			createWindowInstance(0,0,depth+1,objBimsygameover,parentWindow);
			instance_destroy(self);
		}else{
			manager.bimscore++;
			
			if(objBimsymanager.stagesdone==stagenum && objBimsymanager.bimscore==9 && !endless){
				playSound(sndBimTutun,1,1,0);
				audio_stop_sound(manager.bimmusic);
				objBimsymanager.cutscene=endcut;
				var c= createWindowInstance(0,0,depth+1,objBimsycutscene,parentWindow);
				with(c){
					dest=1;
				}
				instance_destroy(self);
			}else{
				if(manager.playmusic){
					manager.bimmusic=playSound(nextmusic,1,manager.gamespeed,0);
				}
				addedscore=1;
			}
			
			
		}
		
	}
	
	if(timer<=30 && !splashed && !objBimsymanager.notransition){
		var sp= instance_create_depth(64,64,depth+11,objBimsySplashtext);
		ds_list_add(parentWindow.children, sp);
		with(sp){
			splashtext=	bimsysplashtext(manager.minigamedeck[manager.deckpointer]);
		}
		splashed=1;
		
	}
	
	if(timer<=0){
		manager.wonlastminigame=0;
		createWindowInstance(0,0,depth+1,manager.minigamedeck[manager.deckpointer],parentWindow);
		instance_destroy(self);
	}
}
