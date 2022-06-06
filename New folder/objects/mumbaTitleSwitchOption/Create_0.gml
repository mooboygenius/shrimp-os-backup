if live_call() return live_result;

event_inherited();

current=0;
options=["op1", "op2", "op3"];

defaultSwitchOptionScript=function() {
	/// @function defaultSwitchOptionScript()
	current++;
	if current>=array_length(options) current=0;
	sprite_index=generateSprite(concat(name, ": ", options[current]), col, outlineCol, font, thick);
}

pressScript=function() {
	defaultSwitchOptionScript();
}