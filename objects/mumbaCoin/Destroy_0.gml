if live_call() return live_result;
if hp<=0 {
	playMumbaSound(sfxMumbaGetCoin, 100, random_range(.9, 1.1));
	with mumbaPlayer {
		coinCoolDown=30;
	}
	with mumbaRealLevel {
		coinsGrabbed++;
	}
	with mumbaPlayerData {
		money+=other.amount;
		updateData("mumbaMoney", money);
	}
	with createMumbaTextEffect(x, y-8, concat("+", amount), $83EEFF, BLACK_COLOR, 90, 0, -.3, .001) {
		squish=.5;
	}
}