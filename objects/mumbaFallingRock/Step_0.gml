if live_call() return live_result;

event_inherited();

if gameFrame%4==0 createMumbaParticle(x+random_range(-1, 1)*4, y-sprite_yoffset, mumbaSmokeParticle);

if place_meeting(x, y, mumbaPlayer) {
	hurt(mumbaPlayer, 1);
}

if place_meeting(x, y+1, mumbaWall) || place_meeting(x, y, mumbaPlayer) || place_meeting(x, y, mumbaTurtle) {
	setCameraShake(2);
	repeat(8) {
		var l=random(16),
		d=random(360);
		createMumbaParticle(x+lengthdir_x(l, d), y+lengthdir_y(l, d), mumbaSmokeParticle);
	}
	repeat(8) {
		var l=random(16),
		d=random(360);
		createMumbaParticle(x+lengthdir_x(l, d), y+lengthdir_y(l, d), mumbaExplosionParticle);
	}
	repeat(8) {
		var l=random(4),
		d=random(360);
		createMumbaParticle(x+lengthdir_x(l, d), y+lengthdir_y(l, d), mumbaRockCrumbleParticle);
	}
	playMumbaSound(sfxMumbaExplosion, 100, random_range(1.2, 1.3));
	instance_destroy();
}

if collision_line(x, y, x, y+32, mumbaWall, false, false) {
	if grace<-2 grace=1;
} else if grace<-10 grace=1;

angle+=5;

drawScript=function(x, y) {
	setSwapAmountShader(c_orange, c_white, 1, wave(0, .3, .5));
	defaultDrawScript(x, y);
	shader_reset();
}