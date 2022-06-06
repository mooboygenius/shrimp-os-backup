if live_call() return live_result;

event_inherited();

unlockedHardMode=false;
showUnlockText=false;
bonusLevel=mumbaBonusLevel;
statsDisplay=instance_create_depth(0, 0, -100, mumbaStatsDisplay);
circleTransition=noone;
shopIntro=noone;
with statsDisplay {
	owner=other;
	drawX=16;
	drawY=76;
}
ds_list_add(children, statsDisplay);

state=0;
timer=0;
current=0;

text=[];

playMumbaMusic(bgmMumbaStats);