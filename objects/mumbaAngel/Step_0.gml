if live_call() return live_result;

event_inherited();

verticalSpeed=lerp(verticalSpeed, wave(-1, 1, .5)*.25, .5)-weight/2;

var p=16,
left=0,
right=p,
findY=false,
findX=x;
with mumbaLevel {
	right=tileSurfaceWidth;
}
if (horizontalSpeed>0 && x>(right+p)) || (horizontalSpeed<0 && x<(left-p)) {
	findX=horizontalSpeed>0 ? right : left;
	findY=true;
	horizontalSpeed*=-1;
	show_debug_message("time 2 find new y");
}

if findY {
	// find the first floor beneath me rn
	var yy=y,
	passed=false,
	reachedBottom=false,
	bottom=GAME_HEIGHT;
	with mumbaLevel {
		bottom=tileSurfaceHeight;
	}
	
	while !passed && !reachedBottom {
		yy++;
		if place_meeting(findX, yy, mumbaWall) {
			passed=true;
		}
		if yy>bottom {
			reachedBottom=true;
		}
	}
		
	// find the ceiling beneath my first floor
	var foundCeiling=false,
	ceilingY=-1;
	while !foundCeiling && !reachedBottom {
		yy++;
		if !place_meeting(findX, yy, mumbaWall) {
			ceilingY=yy;
			foundCeiling=true;
		}
		if yy>bottom {
			reachedBottom=true;
		}
	}
	
	// find the first floor beneath my ceiling
	var foundFloor=false,
	floorY=-1;
	while !foundFloor && !reachedBottom {
		yy++;
		if place_meeting(findX, yy, mumbaWall) {
			floorY=yy;
			foundFloor=true;
		}
		if yy>bottom {
			reachedBottom=true;
		}
	}
	
	if reachedBottom {
		show_debug_message("reached bottom of screen oh well hehe");
	} else {
		y=lerp(ceilingY, floorY, .5);
	}
}