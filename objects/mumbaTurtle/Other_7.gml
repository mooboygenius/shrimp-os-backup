if live_call() return live_result;

switch sprite_index {
	case sprMumbaTurtleGetBackUp:
		state=0;
		flipped=false;
		setSprite(sprMumbaTurtleWalk);
		horizontalSpeed=originalHorizontalSpeed;
	break;
}