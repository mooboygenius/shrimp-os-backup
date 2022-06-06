if live_call() return live_result;

event_inherited();
myWave=wave(0, 4, 2);
targetX=sprite_xoffset+16+xOffset;
targetY=height-sprite_yoffset+myWave+yOffset;

drawScript=function(x, y) {
	var m=.5,
	int=.016;
	setWaveShader(sprite_width*m, sprite_height*m, int, int, (gameFrame div 30)*1)
	defaultDrawScript(sprite_xoffset+16+xOffset, drawY);
	shader_reset();
}