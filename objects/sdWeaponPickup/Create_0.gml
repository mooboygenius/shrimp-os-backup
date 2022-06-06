if live_call() return live_result;

event_inherited();

grabText=concat(grabText, "\nget");

grabScript=function() {
	defaultGrabScript();
	with sdPlayer {
		damage=other.bulletDamage;
		bulletNumber=other.bulletNumber;
		roundsSet=other.roundsSet;
		roundFireSetTime=other.roundFireSetTime;
		weaponSprite=other.weaponSprite;
		bulletSprite=other.bulletSprite;
		bulletsFollowPlayer=other.bulletsFollowPlayer;
		weaponTimer=60*25;
		defaultWeaponOn=false;
		weaponTimer=setWeaponTimer;
		fireSound=other.fireSound;
		playSound(sfxSDWeaponGrab, 100, random_range(.9, 1.1));
	}
}