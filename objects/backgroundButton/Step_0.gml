if live_call() return live_result;

// Inherit the parent event
event_inherited();

squish=lerp(squish, hoveringOver*wave(-1, 1, 1)*.04, .2);
angle=lerp(squish, hoveringOver*wave(-1, 1, 2)*30, .4);

clickFunction=function() {
	var spr=sprite_index,
	done=false;
	with desktopBackground {
		swap=0;
		lastSprite=sprite_index;
		if spr!=sprite_index {
			sprite_index=spr;
			done=true;
		}
		updateData("desktopBackground", sprite_get_name(spr));
		saveGame();
	}
	if done {
		squish+=.03;
	}
}