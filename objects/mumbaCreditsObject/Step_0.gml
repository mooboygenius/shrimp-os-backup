if live_call() return live_result;

event_inherited();

if y<-sprite_yoffset {
	instance_destroy();
}

if snapped {
	if !place_meeting(x, y, mumbaWall) && hp<maximumHp {
		weight=.1;
		horizontalKnockback*=random_range(1, 4);
		verticalKnockback=random_range(-2, -5);
		grace=10;
		snapped=false;
		squish=-.1;
		canCollide=true;
	}
} else {
	life--;
}

if life<=0 instance_destroy();