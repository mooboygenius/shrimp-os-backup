if live_call() return live_result;

event_inherited();

enum mumbaSkullState {idle, leave}

switch state {
	case mumbaSkullState.idle:
		// do nothing
	break;
	
	case mumbaSkullState.leave:
		life--;
		if life<=0 instance_destroy();
		verticalSpeed+=.2;
		angle+=rotateDir;
	break;
}

drawX+=horizontalSpeed;
drawY+=verticalSpeed;