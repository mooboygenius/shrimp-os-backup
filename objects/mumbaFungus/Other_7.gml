if live_call() return live_result;

switch sprite_index {
	case sprMumbaFungusStartJump:
		verticalSpeed=-3;
		horizontalSpeed=1*sign(xScale);
		setSprite(self, sprMumbaFungusJump);
		createMumbaParticle(x+sprite_xoffset, y+sprite_yoffset, mumbaDustParticle);
		createMumbaParticle(x-sprite_xoffset, y+sprite_yoffset, mumbaDustParticle);
		squish=-.1;
	break;
}