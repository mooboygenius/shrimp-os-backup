if live_call() return live_result;

var list=ds_list_create(),
enemies=instance_place_list(x, y, mumbaEnemy, list, false);
for (var i=0; i<enemies; i++) {
	with list[| i] {
		show_debug_message("we slurpin penises");
		var d=point_direction(other.x, other.y, x, y),
		spd=6;
		horizontalKnockback=lengthdir_x(spd, d);
		verticalKnockback=lengthdir_y(spd, d);
	}
}
ds_list_destroy(list);

var list=ds_list_create(),
enemies=instance_place_list(x, y, mumbaCorpse, list, false);
for (var i=0; i<enemies; i++) {
	with list[| i] {
		show_debug_message("we suckin penises");
		var d=point_direction(other.x, other.y, x, y),
		spd=6;
		horizontalKnockback=lengthdir_x(spd*2, d);
		verticalKnockback=lengthdir_y(spd*2, d);
	}
}
ds_list_destroy(list);

event_inherited();

xScale-=.3;
yScale=xScale;