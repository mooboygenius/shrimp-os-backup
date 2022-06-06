if live_call() return live_result;

event_inherited();

if(input(ord("B"),HOLD)&&input(ord("S"),HOLD)){
	deltimer++;
	playSound(sndBimPyorowalk,0,1+deltimer*0.01,0);
	if(deltimer>=180){
		playSound(sndBimBreak,0,1,0);
		stagesdone=updateData("bimsystages", 0);
		colsunlocked=updateData("bimsycols", 1);
		highscores = [0,0,0,0,0];
		highscores[0]=updateData("bimsyhs0", 0);
		highscores[1]=updateData("bimsyhs1", 0);
		highscores[2]=updateData("bimsyhs2", 0);
		highscores[3]=updateData("bimsyhs3", 0);
		highscores[4]=updateData("bimsyhs4", 0);
		unlockedchars=[1,0,0,0,0,0,0];
		unlockedchars[1]=updateData("bimsychar1", 0);
		unlockedchars[2]=updateData("bimsychar2", 0);
		unlockedchars[3]=updateData("bimsychar3", 0);
		unlockedchars[4]=updateData("bimsychar4", 0);
		unlockedchars[5]=updateData("bimsychar5", 0);
		unlockedchars[6]=updateData("bimsychar6", 0);
		unlockedmusic=[1,1,0,0];
		unlockedmusic[2]=updateData("bimsymusic2", 0);
		unlockedmusic[3]=updateData("bimsymusic3", 0);
		saveGame();
		deltimer=0;
	}
}else{
	deltimer=0;	
}