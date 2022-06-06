if live_call() return live_result;

event_inherited();
children=ds_list_create();
title=instance_create_depth(0, 0, 0, mumbaTitle);
ds_list_add(children, title);
pressPrompt=noone;

drawScript=function() {}

with title {
	drawX=-100;
	drawY=-100;
	depth=-1000;
}

surf1=-1;
surf2=-1;
centerY=0;
centerX=0;
state=0;
timer=0;
littleMumba=noone;

unlockMedal("Guess Who's Back?!");

playMumbaMusic(bgmMumbaTitleScreen);