if live_call() return live_result;

// Inherit the parent event
event_inherited();

if canControl {
	var hin=input(sdInputRight)-input(sdInputLeft),
	vin=input(sdInputDown)-input(sdInputUp),
	spd=4.5,
	hsp=hin*spd,
	vsp=vin*spd*.66,
	l=.4;
	horizontalSpeed=lerp(horizontalSpeed, hsp, l);
	verticalSpeed=lerp(verticalSpeed, vsp, l);
	
	if input(sdInputFire) && fireTime<0 {
		fireTime=roundFireSetTime*(roundsSet+1)+5;
		rounds=roundsSet;
	}
	
	fireTime--;
	x=clamp(x, 0, GAME_WIDTH);
	y=clamp(y, 0, GAME_HEIGHT);
}

if rounds>0 {
	roundFireTime--;
	if roundFireTime<=0 {
		var n=0;
		playSound(fireSound, 1, random_range(.9, 1.1));
		repeat(bulletNumber) {
			var d=90,
			xo=0;
			
			switch bulletNumber {
				case 1: /* */ break;
				
				case 2:
					var p=4;
					xo=n>0 ? p : -p;
					show_debug_message(xo);
				break;
				
				default:
					var da=45;
					d=lerp(90-da, 90+da, n/(bulletNumber-1));
				break;
			}
			var inst=instance_create_depth(x+xo+lengthdir_x(sprite_xoffset, d), y+lengthdir_y(sprite_yoffset, d), depth, sdBullet);
			with inst {
				var spd=6;
				sprite_index=other.bulletSprite;
				damage=other.damage;
				horizontalSpeed=lengthdir_x(spd, d);
				verticalSpeed=lengthdir_y(spd, d);
				grace=5;
				squish=.1;
				xOffset=xo;
				bulletsFollowPlayer=other.bulletsFollowPlayer;
			}
			
			n++;
		}
		grace=1;
		squish=.2;
		roundFireTime=roundFireSetTime;
		rounds--;
	}
}

var hs=0, vs=0, pl=.1;
if abs(horizontalSpeed)>.1 hs=sign(horizontalSpeed);
if abs(verticalSpeed)>.1 vs=sign(verticalSpeed);
pan=lerp(pan, hs, pl);
tilt=lerp(tilt, vs, pl);

showUILerp=lerp(showUILerp, showUI, .2);

points=max(points, 0);
pointsLerp=lerp(pointsLerp, points, .2);


if DEV_MODE {
	if input(ord("H"), PRESS) {
		getHurt(1);
	}
}


hurtEffect--;

if weaponTimer<=0 && !defaultWeaponOn {
	roundFireSetTime=roundFireDefaultSetTime;
	roundsSet=roundsDefaultSet;
	weaponSprite=defaultWeaponSprite;
	bulletSprite=defaultBulletSprite;
	bulletsFollowPlayer=true;
	damage=defaultDamage;
	bulletNumber=defaultBulletNumber;
	defaultWeaponOn=true;
	fireSound=defaultFireSound;
}
weaponTimer--;