if live_call() return live_result;
var px=GAME_WIDTH/2,
p=4;
with sdPlayer {
	px=x;
}
for (var i=0; i<ds_list_size(backs); i++) {
	var inst=backs[| i];
	with inst {
		var ia=i*1.5+1,
		lx=lerp(-p*ia, p*ia, px/GAME_WIDTH)
		x=lerp(x, lx, .1);
		verticalSpeed=(i+1)*other.backgroundSpeedLerp;
	}
}

backgroundSpeedLerp=lerp(backgroundSpeedLerp, backgroundSpeed, .1);