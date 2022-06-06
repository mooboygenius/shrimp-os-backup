if live_call() return live_result;

event_inherited();

with mumbaPlayer {
	if canControl && canMove other.timer++;
}

var t=240;

if timer%60==0 && timer>0 {
	if timer>=t {
		playMumbaSound(sfxMumbaSwapBlockTrigger);
	} else {
		playMumbaSound(sfxMumbaSwapBlock);
	}
}

if timer>t {
	with mumbaSwapBlock {
		grace=10;
		swapped=!swapped;
		createMumbaParticle(x+sprite_width/2, y+sprite_height/2, mumbaDustParticle);
	}
	timer=0;
} else if timer>(t-60) {
	with mumbaSwapBlock {
		if grace<-5 grace=2;
	}
} else if timer%60==0 && timer>0 {
	with mumbaSwapBlock {
		grace=5;
	}
}