if live_call() return live_result;

event_inherited();

hurtEffect=-100;

drawScript=function(x, y, scale=1) {
	/// @function defaultDrawScript(x, y, [scale])
	var dx=x,
	dy=y,
	dxs=image_xscale*xScale*scale,
	dys=image_yscale*yScale*scale,
	dang=angle+image_angle;
	if squish>.1 || squish<-.1 {
		dxs+=sign(dxs)*squish;
		dys-=sign(dys)*squish;
	}
	if hurtEffect>0 || (hurtEffect>-20 && hurtEffect%2==0) setSwapAmountShader(c_red, c_white, 1, .5);
	if grace>2 setSwapAmountShader(c_white, c_white, 1, 1);
	draw_sprite_ext(sprite_index, image_index, dx, dy, dxs, dys, dang, image_blend, image_alpha);
	shader_reset();
}

getHurt=function(amount) {
	/// @function getHurt(amount)
	hp-=amount;
	grace=amount*15;
	hurtEffect=amount*25;
	playSound(choose(sfxSDEnemyHit1, sfxSDEnemyHit2, sfxSDEnemyHit3), 1, random_range(.9, 1.1));
	if hp<=0 {
		playSound(sfxSDEnemyKill, 1, random_range(.9, 1.1));
		playSound(choose(sfxSDEnemyDeath1, sfxSDEnemyDeath2, sfxSDEnemyDeath3), 1, random_range(.9, 1.1));
	}
}

defaultEnemyDeath=function() {
	/// @function defaultEnemyDeath()
	with sdPlayer {
		points+=other.pointValue;
		if points>=200000 {
			unlockMedal("Shrimp Defense Expert");
		}
	}
	with instance_create_depth(x, y-4, depth-1, sdTextPopup) {
		text=concat(other.pointValue, "PTS");
		grace=2;
		verticalSpeed=-.4;
	}
	instance_destroy();
	repeat(8) {
		var m=1.5;
		part_particles_create(sdPartSystem, x+random_range(-1, 1)*sprite_xoffset*m, y+random_range(-1, 1)*sprite_yoffset*m, sdDamagePart, 1);
	}
	shakeCamera(3);
	
	var hpChance=.1;
	with sdPlayer {
		if hp>=maximumHp hpChance=.02;
		if hp==1 hpChance=.2;
	}
	if chance(hpChance) {
		instance_create_depth(x, y, depth-1, sdHeartPickup);
	}
	
	if chance(.1) {
		instance_create_depth(x, y, depth-1, choose(sdWeaponPickup, sdDoubleShotPickup, sdTripleShotPickup, sdShotgunPickup));
	}
}

die=function() {
	defaultEnemyDeath();
}