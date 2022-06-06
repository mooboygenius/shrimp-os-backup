if live_call() return live_result;

event_inherited();

gamespeed=1;
playmusic=1;

minigamedeck=[
objBimsyminigameD6,
objBimsyminigameD2,
objBimsyminigameD3,
objBimsyminigameD4,
objBimsyminigameD5,
objBimsyminigameB6,
objBimsyminigameB7,
objBimsyminigameB8];



winv=[sndVBimsySocool,
sndVBimsyVerynice,
sndVBimsyWow1,
sndVBimsyWow2];
losev=[sndVBimsyAwjeez,
sndVBimsyAwshucks,
sndVBimsyNoway,
sndVBimsyThatsmarts];
oneleftv=sndVBimsyOneleft;
startv=sndVBimsyAmen;
gameoverv=sndVBimsyForgiveme;
gameoverhead=sprBimsygameoverbimsy;

deckpointer=-1;

bimscore=0;
hp=4;
wonlastminigame=1;
transition=objBimsyTrGotchi;

notransition=0;

shrimpmode=0;

bimmusic=0;
remixsong=[musBeamsyPray1];
remixriff=musBeamsyPrayFinal;
remixintro=musBeamsyIntro;
songpointer=0;
currstage=0;

mulspeed=1;
wamiugi=0;
emma=0;
soul=0;

stagesdone=loadData("bimsystages", 0);
colsunlocked=loadData("bimsycols", 1);
highscores = [0,0,0,0,0];
highscores[0]=loadData("bimsyhs0", 0);
highscores[1]=loadData("bimsyhs1", 0);
highscores[2]=loadData("bimsyhs2", 0);
highscores[3]=loadData("bimsyhs3", 0);
highscores[4]=loadData("bimsyhs4", 0);
unlockedchars=[1,0,0,0,0,0,0];
unlockedchars[1]=loadData("bimsychar1", 0);
unlockedchars[2]=loadData("bimsychar2", 0);
unlockedchars[3]=loadData("bimsychar3", 0);
unlockedchars[4]=loadData("bimsychar4", 0);
unlockedchars[5]=loadData("bimsychar5", 0);
unlockedchars[6]=loadData("bimsychar6", 0);
unlockedmusic=[1,1,0,0];
unlockedmusic[2]=loadData("bimsymusic2", 0);
unlockedmusic[3]=loadData("bimsymusic3", 0);

cutscene="1-1";
setup=[0,0,0,0,0];

menuposg=[0,0,0,0,0];

deltimer=0;
