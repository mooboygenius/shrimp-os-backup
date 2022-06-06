if live_call() return live_result;

grace--;
squish=lerp(squish, 0, .2);

xstart=x;
ystart=y;

drawYOffset=wave(-2, 2, .5);
angle=lerp(angle, wave(-1, 1, 1)*25, .5);

if place_meeting(x, y, mumbaPlayer) {
	var e=0;
	with mumbaPlayer {
		playMumbaSound(sfxMumbaGetEgg, 100, random_range(.9, 1.1));
		eggs++;
		e=eggs;
	}
	var goalOn=false,
	goal=0;
	with mumbaRealLevel {
		eggsGrabbed++;
		goalOn=enableGoal;
		goal=eggGoal;
	}
	with mumbaEnemySpawner {
		if e%10==0 {
			repeat(5) show_debug_message("THE WAVES ARE GETTING HARDER");
			hardWaveFrequency--;
			hardWaveChance+=.05;
			if hardWaveFrequency<2 hardWaveFrequency=2;
			if hardWaveChance>.6 hardWaveChance=.6;
			var t=20;
			spawnTimerMinimum-=t;
			spawnTimerMaximum-=t/2;
			if spawnTimerMinimum<60 spawnTimerMinimum=60;
			if spawnTimerMaximum<120 spawnTimerMaximum=120;
		}
	}
	
	var s=concat(e);
	if goalOn {
		s=concat(e, "/", goal);
	}
	with createMumbaTextEffect(x, y-8, s, WHITE_COLOR, BLACK_COLOR, 90, 0, -.3, .001) {
		squish=.5;
	}
	
	show_debug_message("egg obtained");
	instance_destroy();
}

if place_meeting(x, y, mumbaBullet) {
	grace=5;
}

var mx=0, my=0;
with mumbaPlayer {
	mx=x;
	my=y;
}
if collision_line(x, y, mx, my, mumbaWall, true, true) {
	life--;
	if life%120==0 show_debug_message(concat("wall between egg and player -- ", life));
}
if life<=0 {
	instance_destroy();
}

glowScale=lerp(glowScale, wave(.8, 1.2, .5), .5);