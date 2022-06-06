if live_call() return live_result;

event_inherited();

readySpeed=0;
goSpeed=0;
readyX=GAME_WIDTH+sprite_get_xoffset(sprMumbaReady);
goX=-sprite_get_xoffset(sprMumbaGo);
readySquish=0;
goSquish=0;
state=0;
show=true;
timer=0;