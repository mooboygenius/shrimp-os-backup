if live_call() return live_result;

state=0;
timer=0;

instance_create_depth(0, 0, -10000, firstTimeCircleTransition);

text="Please wait temporarily.\nPerforming first time setup...";

defaultDrawY=1/5*GAME_HEIGHT;
defaultDrawX=GAME_WIDTH div 2;

drawX=defaultDrawX;
drawY=defaultDrawY;

loading=instance_create_depth(defaultDrawX, 2/3*GAME_HEIGHT, -10, firstTimeLoading);

bounceY=0;

failedNameAttempts=0;

enteredName="";

substate=0;
subtimer=0;

playMusicFromIndex(0);