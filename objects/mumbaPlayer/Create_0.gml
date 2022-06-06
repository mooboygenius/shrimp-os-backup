if live_call() return live_result;

event_inherited();

canHurt=0;
myGunObject=noone;
myGunInstance=noone;
myHatObject=noone;
myHatInstance=noone;
myUI=instance_create_depth(0, 0, 0, mumbaUIController);

with myUI {
	visible=false;
}
setCameraFocus(self);

die=function() {
	
}

getHurt=function(amt) {
	if grace<-30 && canHurt<0 {
		playMumbaSound(choose(sfxMumbaEnemyHurt1, sfxMumbaEnemyHurt2, sfxMumbaEnemyHurt3), 100, random_range(1.3, 1.5));
		setCameraShake(2);
		hp-=amt;
		grace=amt*30;
	}
}

walkingTime=0;
jumpingTime=0;
dead=false;

show_debug_message(concat("new mumba dropped ", instance_number(mumbaPlayer)));