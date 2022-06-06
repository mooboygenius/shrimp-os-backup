if live_call() return live_result;

event_inherited();

drawScript=function() {}

mySign=instance_create_depth(x, y, depth, mumbaDangerSign);
with mySign {
	show_debug_message(concat("sign ", id, ": ", y));
}