if live_call() return live_result;

event_inherited();

if ds_exists(children, ds_type_list) {
	var bx=0,
	by=0;
	with building {
		bx=x+sprite_xoffset;
		by=y;
	}

	var cx=goalX, cy=goalY;

	with parentWindow {
		cx+=drawXOffset;
		cy+=drawYOffset;
	}

	with transition {
		circleX=cx;
		circleY=cy;
	}

	var d=0;
	with myPlayer {
		d=depth;
	}

	with frontBuilding {
		x=bx-sprite_xoffset;
		y=by;
		depth=d-1;
	}

	with parentWindow {
		cameraFocus=noone;
		cameraX=-32;
		cameraY=0;
		cameraLeftLimit=0;
		cameraTopLimit=0;
		cameraRightLimit=0;
		cameraBottomLimit=0;
	}

	with myPlayer {
		while place_meeting(x, y, mumbaWall) y--;
	}
}

doStateMachine();

with myPlayer {
	show_debug_message("ha");
}