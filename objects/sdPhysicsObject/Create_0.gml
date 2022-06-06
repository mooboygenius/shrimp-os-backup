if live_call() return live_result;

// Inherit the parent event
event_inherited();

usePhysics=function() {
	/// @function usePhysics()
	var h=horizontalSpeed+horizontalKnockback,
	v=verticalSpeed+verticalKnockback;
	x+=h;
	y+=v;
	horizontalKnockback=lerp(horizontalKnockback, 0, weight);
	verticalKnockback=lerp(verticalKnockback, 0, weight);
}