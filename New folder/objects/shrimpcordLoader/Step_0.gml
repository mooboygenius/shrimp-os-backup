if live_call() return live_result;

event_inherited();

shrimpAngle+=shrimpAcceleration*6;
shrimpShake+=shrimpAcceleration/100;
shrimpAcceleration+=.005;

if timer%20==0 {
	shrimpText+=".";
	if string_pos("....", shrimpText) {
		shrimpText="LOADING";
	}
}

if timer>pauseAtFrame && pauseLength>0 {
	timer+=.2;
	pauseLength--;
	shrimpFrame+=.1;
} else if timer>goalTime {
	finishLoadTime--;
	if finishLoadTime<=0 {
		state=windowStates.close;
		if !instance_exists(shrimpcord) instance_create_depth(0, 0, 0, shrimpcord);
	}
} else {
	timer++;
	shrimpFrame+=.3;
}