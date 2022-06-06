if live_call() return live_result;

// Inherit the parent event
event_inherited();

drawX+=horizontalSpeed;
drawY+=verticalSpeed;
var m=5;
angle+=(horizontalSpeed+verticalSpeed)*m;
verticalSpeed+=weight;
life--;
if life<=0 instance_destroy();