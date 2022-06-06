if live_call() return live_result;

// Inherit the parent event
event_inherited();

canMove=true;
canControl=true;
pan=0;
tilt=0;
weaponTimer=-1;
setWeaponTimer=60*25;
defaultWeaponOn=true;

drawScript=function(x, y, scale=1) {
	var xo=sprite_xoffset*(scale+squish),
	yo=sprite_yoffset*(scale-squish),
	m=.4,
	realPan=pan*xo*m,
	realTilt=-tilt*yo*m*.4,
	left=x-xo+abs(realPan),
	right=x+xo-abs(realPan),
	top=y-yo+abs(realTilt),
	bottom=y+yo-abs(realTilt),
	x1=left+realTilt,
	y1=top-realPan,
	x2=right-realTilt,
	y2=top+realPan,
	x3=right+realTilt,
	y3=bottom-realPan,
	x4=left-realTilt,
	y4=bottom+realPan;
	if hurtEffect>=-10 || (hurtEffect>=-20 && hurtEffect%2==0) setSwapAmountShader(c_red, c_white, 1, .5);
	if grace>=20 || (grace>=0 && grace%4==0) setSwapAmountShader(WHITE_COLOR, WHITE_COLOR, 1, 1);
	if drawSelf draw_sprite_pos(sprite_index, image_index, x1, y1, x2, y2, x3, y3, x4, y4, 1);
	shader_reset();
}

defaultFireSound=sfxSD1Shot;
fireSound=defaultFireSound;

fireTime=0;
defaultSetFireTime=5;
setFireTime=defaultSetFireTime;

roundFireTime=0;
roundFireDefaultSetTime=5;
roundFireSetTime=roundFireDefaultSetTime;

rounds=0;
roundsDefaultSet=4;
roundsSet=roundsDefaultSet;

defaultWeaponSprite=sprSDBasicWeaponIcon;
weaponSprite=defaultWeaponSprite;

defaultBulletSprite=sprSDBullet;
bulletSprite=defaultBulletSprite;

bulletsFollowPlayer=true;

defaultDamage=.25;
damage=defaultDamage;

bulletNumber=1;
defaultBulletNumber=bulletNumber;

uiSurface=surface_create(GAME_WIDTH, GAME_HEIGHT);

logoScale=.25;
logoScaleLerp=logoScale;

showUI=true;
showUILerp=showUI;

points=0;
pointsLerp=0;
hurtEffect=0;

deathState=0;
deathTimer=0;
drawSelf=true;

die=function() {
	canControl=false;
	horizontalSpeed=0;
	verticalSpeed=0;
	switch deathState {
		case 0:
			shakeCamera(5);
			with sdBackgroundController {
				backgroundSpeed=0;
			}
			audio_group_stop_all(bgm);
			drawSelf=false;
			repeat(12) {
				part_particles_create(sdPartSystem, x+random_range(-sprite_xoffset, sprite_xoffset), y+random_range(-sprite_yoffset, sprite_yoffset), sdDamagePart, 1);
			}
			deathState=1;
		break;
		
		case 1:
			deathTimer++;
			if deathTimer>=60 {
				showUI=false;
				deathState=2;
				deathTimer=0;
			}
		break;
		
		case 2:
			deathTimer++;
			showDeathMessage=false;
			if deathTimer%2==0 showDeathMessage=true;
			if deathTimer>30 {
				showDeathMessage=true;
				deathTimer=0;
				deathState=3;
			}
		break;
		
		case 3:
			if keyboard_check_released(vk_anykey) {
				var o=sdLevel1;
				with sdEnemyWaveController {
					o=object_index;
					instance_destroy();
				}
				with sdEnemy {
					instance_destroy();
				}
				with sdSpitWormProjectile {
					instance_destroy();
				}
				event_perform(ev_create, 0);
				hp=maximumHp;
				canControl=true;
				squish=1;
				x=GAME_WIDTH div 2;
				y=GAME_HEIGHT-64;
				grace=15;
				shakeCamera(2);
				deathState=0;
				instance_create_depth(0, 0, 0, o);
			}
		break;
	}
}

getHurt=function(amount) {
	/// @function getHurt(amount)
	if grace<0 && hp>0 {
		hp-=amount;
		if hp<=0 {
			playSound(sfxSDPlayerDeath, 100, 1);
		}
		grace=amount*30;
		hurtEffect=30;
		shakeCamera(3);
		playSound(sfxSDEnemyHit1, 100, random_range(1.3, 1.5));
		with instance_create_depth(x, y-sprite_yoffset, depth-1, sdTextPopup) {
			text=choose("OUCH", "OWIE", "YEOWCH", "OW", "SHIT", "FUCK");
			life=40;
			verticalSpeed=-.5;
		}
		points-=1000;
	}
}

showDeathMessage=false;