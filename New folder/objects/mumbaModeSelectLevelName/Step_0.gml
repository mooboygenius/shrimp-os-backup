if live_call() return live_result;

event_inherited();

drawX+=horizontalSpeed;
drawY+=verticalSpeed;

while sprite_width>GAME_WIDTH-20 {
	image_xscale-=.01;
}