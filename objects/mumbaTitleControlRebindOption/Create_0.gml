if live_call() return live_result;

event_inherited();

pressScript=function() {
	if state==0 {
		holdTimer=0;
		state=1;
		with mumbaTitleControlSettings {
			freezeSelection=true;
		}
		sprite_index=generateSprite(concat(name, ": Press a key!!"), col, outlineCol, font, thick);
	}
}

state=-2;

holdTimer=0;