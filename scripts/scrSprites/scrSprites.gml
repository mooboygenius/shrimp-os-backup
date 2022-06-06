function setSprite(instance, sprite) {
	var s=sprite;
	with instance {
		if sprite_index!=sprite {
			sprite_index=sprite;
			image_index=0;
		}
	}
}