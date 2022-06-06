// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function bimsysetup(stage,character,song,endless,shrimp){
	var cha=character;
	if(cha==0){
		switch(objBimsymanager.currstage){
			case 0: cha=1; break;	
			case 1: cha=2; break;	
			case 2: cha=3; break;	
			case 3: cha=1; break;	
			case 4: cha=4; break;	
		}
		if(endless){
			cha=4;
		}
	}

	
	switch(cha){
		case 1: //bimsy
			objBimsymanager.winv=[sndVBimsySocool,
			sndVBimsyVerynice,
			sndVBimsyWow1,
			sndVBimsyWow2];
			objBimsymanager.losev=[sndVBimsyAwjeez,
			sndVBimsyAwshucks,
			sndVBimsyNoway,
			sndVBimsyThatsmarts];
			objBimsymanager.oneleftv=sndVBimsyOneleft;
			objBimsymanager.startv=sndVBimsyAmen;
			objBimsymanager.gameoverv=sndVBimsyForgiveme;
			objBimsymanager.gameoverhead=sprBimsygameoverbimsy;
		break;
		case 2: //sec
			objBimsymanager.winv=[sndVSecPerformance,
			sndVSecWow,
			sndVSecAlright,
			sndVSecGreat];
			objBimsymanager.losev=[sndVSecAiee,
			sndVSecUbubu,
			sndVSecOhdear,
			sndVSecBummer];
			objBimsymanager.oneleftv=sndVSecLastlife;
			objBimsymanager.startv=sndVSecLookalive;
			objBimsymanager.gameoverv=sndVSecTryagain;
			objBimsymanager.gameoverhead=sprBimsygameoversec;
		break;
		case 3: //marisha
			objBimsymanager.winv=[sndVMarishaBallin,
			sndVMarishaFarout,
			sndVMarishaHeckyea,
			sndVMarishaThisrocks];
			objBimsymanager.losev=[sndVMarishaAwcomeon,
			sndVMarishaAwhell,
			sndVMarishaDammit,
			sndVMarishaWhatthe];
			objBimsymanager.oneleftv=sndVMarishaOneleft;
			objBimsymanager.startv=sndVMarishaItson;
			objBimsymanager.gameoverv=sndVMarishaGoshdangit;
			objBimsymanager.gameoverhead=sprBimsygameovermarisha;
		break;
		case 4: //beamsy
			objBimsymanager.winv=[sndVBeamsyAcceptable,
			sndVBeamsyGoodenough,
			sndVBeamsyHellyea,
			sndVBeamsyShrimple];
			objBimsymanager.losev=[sndVBeamsyGoddamn,
			sndVBeamsyGodssake,
			sndVBeamsyHeavens,
			sndVBeamsyOhno];
			objBimsymanager.oneleftv=sndVBeamsyLastchance;
			objBimsymanager.startv=sndVBeamsyWelcome;
			objBimsymanager.gameoverv=sndVBeamsyThatsit;
			objBimsymanager.gameoverhead=sprBimsygameoverbeamsy;
		break;
		case 5: //gamio
			objBimsymanager.winv=[sndVGamioSupergamio,
			sndVGamioSuper,
			sndVGamioYahoo,
			sndVGamioForever];
			objBimsymanager.losev=[sndVGamioScream,
			sndVGamioMammamia,
			sndVGamioNo,
			sndVGamioMamafucker];
			objBimsymanager.oneleftv=sndVGamioLast;
			objBimsymanager.startv=sndVGamioLetsago;
			objBimsymanager.gameoverv=sndVGamioGameover;
			objBimsymanager.gameoverhead=sprBimsygameovergamio;
		break;
		case 6: //petet
			objBimsymanager.winv=[sndVPetetYeaurgh];
			objBimsymanager.losev=[sndVPetetYeaurgh];
			objBimsymanager.oneleftv=sndVPetetYeaurgh;
			objBimsymanager.startv=sndVPetetYeaurgh;
			objBimsymanager.gameoverv=sndVPetetYeaurgh;
			objBimsymanager.gameoverhead=sprBimsygameoverpetet;
		break;
	}
	
	objBimsymanager.gamespeed=1;
	objBimsymanager.deckpointer=-1;
	objBimsymanager.bimscore=0;
	objBimsymanager.hp=4;
	objBimsymanager.wonlastminigame=1;
	objBimsymanager.songpointer=0;
	objBimsymanager.mulspeed=1;
	
	objBimsymanager.shrimpmode=shrimp;
	objBimsymanager.playmusic=1;
	objBimsymanager.notransition=endless;
	
	switch(stage){
		case 0: //bimsy
			objBimsymanager.transition=objBimsyTrBimsy;
			objBimsymanager.minigamedeck=[
			objBimsyminigameB1,
			objBimsyminigameB2,
			objBimsyminigameB3,
			objBimsyminigameB4,
			objBimsyminigameB5,
			objBimsyminigameB6,
			objBimsyminigameB7,
			objBimsyminigameB8];
			
		break;
		case 1: //sec
			objBimsymanager.transition=objBimsyTrSec;
			objBimsymanager.minigamedeck=[
			objBimsyminigameD1,
			objBimsyminigameD2,
			objBimsyminigameD3,
			objBimsyminigameD4,
			objBimsyminigameD5,
			objBimsyminigameD6,
			objBimsyminigameD7,
			objBimsyminigameD8];
		break;
		case 2: //marisha
			objBimsymanager.transition=objBimsyTrMarisha;
			objBimsymanager.minigamedeck=[
			objBimsyminigameM1,
			objBimsyminigameM2,
			objBimsyminigameM3,
			objBimsyminigameM4,
			objBimsyminigameM5,
			objBimsyminigameM6,
			objBimsyminigameM7,
			objBimsyminigameM8];
		break;
		case 3: //remix
			objBimsymanager.transition=objBimsyTrGotchi;
			objBimsymanager.minigamedeck=[
			objBimsyminigameB1,
			objBimsyminigameB2,
			objBimsyminigameB3,
			objBimsyminigameB4,
			objBimsyminigameB5,
			objBimsyminigameB6,
			objBimsyminigameB7,
			objBimsyminigameB8,
			objBimsyminigameD1,
			objBimsyminigameD2,
			objBimsyminigameD3,
			objBimsyminigameD4,
			objBimsyminigameD5,
			objBimsyminigameD6,
			objBimsyminigameD7,
			objBimsyminigameD8,
			objBimsyminigameM1,
			objBimsyminigameM2,
			objBimsyminigameM3,
			objBimsyminigameM4,
			objBimsyminigameM5,
			objBimsyminigameM6,
			objBimsyminigameM7,
			objBimsyminigameM8
			];
		break;
		
		
	}
	objBimsymanager.playmusic=0; 
	objBimsymanager.remixriff=sndBimCuica;
	objBimsymanager.remixintro=musBeamsyIntro;
	
	if(objBimsymanager.colsunlocked!=4 && endless){
		song=1;
	}
		
		
	switch(song){
		case 0: objBimsymanager.playmusic=1; break;
		case 1: 
			objBimsymanager.remixintro=ShrimpOSPrutte01
			objBimsymanager.playmusic=0;
			objBimsymanager.remixsong=[
			ShrimpOSPrutte02,
			ShrimpOSPrutte03,
			ShrimpOSPrutte04,
			ShrimpOSPrutte05,
			ShrimpOSPrutte06,
			ShrimpOSPrutte07,
			ShrimpOSPrutte08,
			ShrimpOSPrutte09,
			ShrimpOSPrutte10];
			objBimsymanager.remixriff=ShrimpOSPrutte11;
		
		break;
		case 2:
			objBimsymanager.remixsong=[musBeamsyPray1,
			musBeamsyPray2,
			musBeamsyPray3,
			musBeamsyPray4,
			musBeamsyPray5,
			musBeamsyPray6,
			musBeamsyPray1,
			musBeamsyPray2,
			musBeamsyPray7,
			musBeamsyPray8,
			musBeamsyPray9,
			musBeamsyPray10,
			musBeamsyPray1,
			musBeamsyPray2,
			musBeamsyPray11,
			musBeamsyPray12,
			musBeamsyPray13,
			musBeamsyPray14,
			musBeamsyPray1,
			musBeamsyPray2,
			musBeamsyPray15,
			musBeamsyPray16,
			musBeamsyPray17,
			musBeamsyPray18,
			musBeamsyPray1,
			musBeamsyPray2,
			musBeamsyPray19,
			musBeamsyPray20,
			musBeamsyPray21,
			musBeamsyPray22,
			musBeamsyPray1,
			musBeamsyPray2,
			musBeamsyPray23,
			musBeamsyPray24,
			musBeamsyPray25,
			musBeamsyPray26,
			musBeamsyPray1,
			musBeamsyPray2,
			musBeamsyPray27,
			musBeamsyPray28,
			musBeamsyPray29,
			musBeamsyPray30,
			musBeamsyPray1,
			musBeamsyPray2,
			musBeamsyPray31,
			musBeamsyPray32,
			musBeamsyPray33,
			musBeamsyPray34];
			objBimsymanager.remixriff=musBeamsyPrayFinal;
		break;
			
		case 3:
			objBimsymanager.remixintro=musHk97intro;
			objBimsymanager.remixsong=[
			musHK972,
			musHK973,
			musHk971];
			objBimsymanager.remixriff=musHk971;
		break;
	}	
	
	
	objBimsymanager.currstage=stage;
	
	if(objBimsymanager.emma){
		objBimsymanager.hp=1;
		objBimsymanager.gamespeed=2;
	}
	
	if(objBimsymanager.soul){
		objBimsymanager.mulspeed=1.02;
	}
	
	bimsyscrambledeck();
	if(endless){
		objBimsymanager.transition=objBimsyTrBeamsy;
		
		
		objBimsymanager.currstage=4;
		if(objBimsymanager.colsunlocked!=4){
			objBimsymanager.shrimpmode=1;
		}
		objBimsymanager.currstage=4;
		
		createWindowInstance(0,0,depth+5,objBimsyBeamsy,parentWindow);
	}
	
	createWindowInstance(0,0,depth+1,objBimsymanager.transition,parentWindow);
}