if live_call() return live_result;
newBullet=noone;
justFired=false;

event_inherited();

var canFire=false;

with owner {
	other.parentWindow=parentWindow;
	other.xScale=xScale;
	var l=.5,
	tx=x+(1+sprite_xoffset+other.sprite_xoffset)*other.xScale,
	ty=y;
	if abs(horizontalSpeed)>.5 ty+=wave(-1, 1, .5)*1;
	other.x=lerp(other.x, tx, l);
	other.y=lerp(other.y, ty, l);
	canFire=canMove && canControl;
	if point_distance(x, y, other.x, other.y)>48 {
		other.x=x;
		other.y=y;
	}
}

fireTimer--;

if canFire && input(mumbaInputFire) && fireTimer<=0 {
	timesFired++;
	fireTimer=fireRate;
	var sprite=object_get_sprite(bulletObject),
	xo=sprite_get_xoffset(sprite),
	bx=x+xo*xScale,
	by=y;
	x+=-sign(xScale)*8;
	justFired=true;
	playMumbaSound(weaponSound, 10, random_range(weaponSoundMinimumPitch, weaponSoundMaximumPitch));
	var n=0;
	grace=1;
	repeat(bulletNumber) {
		with owner {
			horizontalKnockback=-other.bulletSpeed*sign(other.xScale)*.1;
		}
		newBullet=instance_create_depth(bx, by, depth-1, bulletObject);
		
		var dam=bulletDamageMultiplier,
		dir=0,
		addA=0;
		if bulletNumber>1 {
			addA=lerp(-multiShotSpread, multiShotSpread, n/(bulletNumber-1));
		}
		createMumbaParticle(bx, by-4, mumbaDustParticle);
		
		with newBullet {
			var a=90-sign(other.xScale)*90+addA+random_range(-other.inaccuracy, other.inaccuracy),
			spd=other.bulletSpeed*random_range(.95, 1.05);
			angle=a;
			horizontalSpeed=lengthdir_x(spd, a);
			verticalSpeed=lengthdir_y(spd, a);
			dir=a+180;
			grace=2*dam+random_range(-1, 2);
			squish=-.5;
			dam*=damage;
		}
		
		squish=-.25;
		grace=2*dam;
		angle=30*sign(xScale);
		var shake=min(2, dam*.2);
		setCameraShake(shake);
		setCameraKick(shake, dir);
		
		with parentWindow {
			ds_list_insert(children, 0, other.newBullet);
		}
		
		
		if sprite_exists(uiCasingSprite) {
			var d=90,
			da=d+sign(horizontalSpeed)*100;
			part_type_direction(mumbaBulletParticle, da-20, da+20, 0, 0);
			
			createMumbaParticle(x, y, mumbaBulletParticle, 0);
		}
		
		n++;
	}
}

angle=lerp(angle, 0, .2);