if live_call() return live_result;

event_inherited();

getHurt=function(amount) {
	/// @function getHurt(amount)
	hp-=amount;
	grace=amount*15;
}

die=function() {
	/// @function die()
	instance_destroy();
}