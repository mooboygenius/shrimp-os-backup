if live_call() return live_result;

event_inherited();

drawScript=function(x, y) {
	setWaveShader(sprite_width, sprite_height, 1, 1, gameFrame);
	defaultDrawScript(x, y);
	shader_reset();
}

waveMultiplier=4;

state=0;
timer=0;
lerpRate=.01;
drawShake=0;