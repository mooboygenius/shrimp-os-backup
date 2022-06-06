if live_call() return live_result;

event_inherited();

yOffset=0;

clickFunction=function() {
	var sound=sfxBabyD1,
	fullName=name+"D1",
	asset=asset_get_index(fullName);
	show_debug_message(concat(fullName, " ", asset));
	if asset {
		sound=asset;
	}
	playSound(sound, 0, 1);
	var spr=object_get_sprite(instrumentObject);
	with dragInstrument {
		sprite_index=spr;
		createObject=other.instrumentObject;
	}
	grace=2;
	xScale=1.5;
	yScale=xScale;
	yOffset=-4;
}

drawScript=function(x, y) {
	y+=yOffset;
	if hoveringOver {
		var amt=.5;
		if grace>0 amt=1;
		setSwapAmountShader(c_white, c_white, 1, .5);
	}
	defaultDrawScript(x, y);
	shader_reset();
}