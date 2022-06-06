if live_call() return live_result;

event_inherited();

fakeHp=hp;
state=0;
flipped=false;

getHurt=function(amt) {
	/// @function getHurt(amount)
	if object_is_ancestor(object_index, mumbaLivingObject) {
		if !flipped {
			grace=amt*10;
			fakeHp-=amt;
			playMumbaSound(choose(sfxMumbaEnemyHurt1, sfxMumbaEnemyHurt2, sfxMumbaEnemyHurt3), 10, random_range(.8, 1.1));
		}
	}
}

timer=0;
moveSpeed=.5;
horizontalSpeed=moveSpeed;
originalHorizontalSpeed=moveSpeed;