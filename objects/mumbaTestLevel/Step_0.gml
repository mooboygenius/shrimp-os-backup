if live_call() return live_result;

event_inherited();

if input(ord("I"), PRESS) {
	repeat(10) {
		var inst=instance_create_depth(random(tileSurfaceWidth), 0, -10, choose(mumbaCrab, mumbaSquirrel, mumbaRat, mumbaFungus, mumbaSnowman, mumbaTurtle));
		ds_list_add(children, inst);
	}
	show_debug_message(concat("enemy count: ", instance_number(mumbaEnemy)));
}

if input(ord("B")) {
	var n=20,
	d=GAME_WIDTH/n,
	xx=0;
	repeat(n) {
		var inst=instance_create_depth(xx, 0, -10, mumbaBullet);
		with inst {
			horizontalSpeed=0;
			verticalSpeed=8;
			angle=270;
			life=240;
		}
		with parentWindow ds_list_add(children, inst);
		xx+=d;
	}
}