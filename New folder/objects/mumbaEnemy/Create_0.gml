if live_call() return live_result;

event_inherited();

drawScript=function(x, y) {
	setSwapAmountShader(c_red, c_white, 1, min(anger, .5));
	defaultDrawScript(x, y);
	if anger>0 shader_reset();
}

getHurt=function(amt) {
	/// @function getHurt(amount)
	playMumbaSound(choose(sfxMumbaEnemyHurt1, sfxMumbaEnemyHurt2, sfxMumbaEnemyHurt3), 10, random_range(.8, 1.1));
	grace=amt*10;
	hp-=amt;
}