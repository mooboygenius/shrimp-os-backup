if live_call() return live_result;

event_inherited();

enum fileState {
	idle=0,
	open=10,
	move=100,
	rename=200,
	disappear=300
}

switch state {
	case fileState.idle:
		var l=.8;
		x=lerp(x, nearestAcceptableX, l);
		y=lerp(y, nearestAcceptableY, l);
		
		var isHighest=HIGHEST_INSTANCE_UNDER_MOUSE==id;
		
		if hoveringOver && input(mb_left, RELEASE) && isHighest {
			state=fileState.open;
			grace=5;
			squish=-1;
			show_debug_message("opening file");
		}
		
		if hoveringOver && input(mb_left) && isHighest {
			if holdTimer==0 grace=4;
			holdTimer++;
			if holdTimer>2 && (previousMouseX!=getMouseX() || previousMouseY!=getMouseY()) {
				state=100;
				grace=2;
			}
		} else {
			holdTimer=0;
		}
	break;
	
	case fileState.open:
		if instance_number(window)<MAXIMUM_WINDOWS {
			childWindow=instance_create_depth(x, y, depth-10, windowToOpen);
			with childWindow {
				myFile=other;
				loadFileData(other.saveInfo);
			}
		} else {
			if !instance_exists(tooManyWindows) {
				instance_create_depth(x, y, depth-10, tooManyWindows);
			}
		}
		state=fileState.idle;
	break;
	
	case fileState.move:
		if input(mb_left) {
			var l=.25;
			x=lerp(x, getMouseX(), l);
			y=lerp(y, getMouseY(), l);
		}
		if input(mb_left, RELEASE) {
			hoveringOver=false;
			state=0;
			holdTimer=-20;
			squish=2;
			grace=4;
		}
	break;
	
	case fileState.rename:
		if input(mb_left, PRESS) || input(vk_enter, PRESS) {
			state=fileState.idle;
			grace=10;
			squish=1;
			saveDesktopFiles();
		} else {
			fileName=getStringInput(fileName, false);
		}
	break;
	
	case fileState.disappear:
		var r=.03;
		xScale+=r;
		yScale+=r;
		if xScale>1.4 {
			state=fileState.disappear+1;
			grace=1;
		}
	break;
	
	case fileState.disappear+1:
		var r=.2;
		xScale-=r;
		yScale-=r;
		angle+=30;
		if xScale<0 || yScale<0 instance_destroy();
	break;
}

if state<fileState.disappear {
	if previousHovering!=hoveringOver {
		var sq=.5;
		if hoveringOver {
			squish=sq;
		} else {
			squish=-sq;
		}
		grace=2;
		previousHovering=hoveringOver;
	}

	var xsc=1,
	ang=0;
	if hoveringOver {
		xsc=wave(-1, 1, 1);
		ang=wave(-1, 1, .5)*5;
	}
	xScale=lerp(xScale, xsc, .2);
	yScale=lerp(yScale, 1, .2);
	angle=lerp(angle, ang, .2);
}

nearestAcceptableX=round((x-offsetX)/shiftX)*shiftX+offsetX;
nearestAcceptableY=round((y-offsetY)/shiftY)*shiftY+offsetY;
var l=.4;
selectionBoxX=lerp(selectionBoxX, nearestAcceptableX, l);
selectionBoxY=lerp(selectionBoxY, nearestAcceptableY, l);