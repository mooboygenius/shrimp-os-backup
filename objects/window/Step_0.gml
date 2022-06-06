if live_call() return live_result;

event_inherited();

enum windowStates {
	opening1=-3,
	opening2=-2,
	idle=0,
	moving=1,
	resizing=2,
	close=-5
}

switch state {
	case windowStates.opening1:
		var t=1.05;
		windowScale=lerp(windowScale, t, .4);
		if windowScale>=t-.02 {
			windowScale=t;
			state=windowStates.opening2;
		}
	break;
	
	case windowStates.opening2:
		windowScale=lerp(windowScale, 1, .3);
		if windowScale<=1.05 {
			windowScale=1;
			state=windowStates.idle;
		}
	break;
	
	case windowStates.close:
		windowScale-=.2;
		if windowScale<=0 instance_destroy();
	break;
	
	case windowStates.idle:
		if !lockPosition && getMouseInRectangle(dragLeft, dragTop, dragRight, dragBottom) && HIGHEST_INSTANCE_UNDER_MOUSE==id && input(mb_left, PRESS) state=windowStates.moving;
		
		for (var i=0; i<array_length(border); i++) {
			var a=[0, 0, 0, 0];
			for (var z=0; z<array_length(border[i][1]); z++) {
				a[z]=border[i][1][z];
			}
			if getMouseInRectangle(a[0], a[1], a[2], a[3]) && HIGHEST_INSTANCE_UNDER_MOUSE==id && !lockSize {
				if i==borders.right || i==borders.left with cursor pullHorizontal=true;
				if i==borders.top || i==borders.bottom with cursor pullVertical=true;
				if input(mb_left, PRESS) {
					pullingBorder=i;
					state=2;
				}
			}
		}
	break;
	
	case windowStates.moving:
		var xDif=getMouseX()-previousMouseX,
		yDif=getMouseY()-previousMouseY;
		border[borders.left][0]+=xDif;
		border[borders.top][0]+=yDif;
		border[borders.right][0]+=xDif;
		border[borders.bottom][0]+=yDif;
		if input(mb_left, RELEASE) state=0;
	break;
	
	case windowStates.resizing:
		var in=0,
		minSize=64;
		
		if pullingBorder==borders.left || pullingBorder==borders.right {
			with cursor pullHorizontal=true;
			in=getMouseX()-previousMouseX;
		}
		
		if pullingBorder==borders.top || pullingBorder==borders.bottom {
			with cursor pullVertical=true;
			in=getMouseY()-previousMouseY;
		}
		
		border[pullingBorder][0]+=in;
		
		var p=48;
		switch pullingBorder {
			case borders.right:
				if (border[pullingBorder][0])<(border[borders.left][0]+p) border[pullingBorder][0]=border[borders.left][0]+p;
			break;
			
			case borders.top:
				if (border[pullingBorder][0])>(border[borders.bottom][0]-p) border[pullingBorder][0]=border[borders.bottom][0]-p;
			break;
			
			case borders.left:
				if (border[pullingBorder][0])>(border[borders.right][0]-p) border[pullingBorder][0]=border[borders.right][0]-p;
			break;
			
			case borders.bottom:
				if (border[pullingBorder][0])<(border[borders.top][0]+p) border[pullingBorder][0]=border[borders.top][0]+p;
			break;
		}
		
		if input(mb_left, RELEASE) {
			pullingBorder=-1;
			state=0;
		}
	break;
}

// keep borders contained
while border[borders.right][0]>room_width {
	border[borders.right][0]--;
	border[borders.left][0]--;
}

while border[borders.left][0]<0 {
	border[borders.right][0]++;
	border[borders.left][0]++;
}

while border[borders.bottom][0]>room_height {
	border[borders.top][0]--;
	border[borders.bottom][0]--;
}

while border[borders.top][0]<0 {
	border[borders.top][0]++;
	border[borders.bottom][0]++;
}

dragLeft=border[borders.left][0]+1;
dragTop=border[borders.top][0]+1;
dragRight=border[borders.right][0];
dragBottom=dragTop+8;

x=border[borders.left][0];
y=border[borders.top][0];
//show_debug_message(concat("x ", x, "   y ", y, "   width ", sprite_width, "  height ", sprite_height));

windowWidth=(border[borders.right][0]-border[borders.left][0]);
windowHeight=(border[borders.bottom][0]-border[borders.top][0]);
image_xscale=windowWidth/sprite_get_width(sprite_index);
image_yscale=windowHeight/sprite_get_height(sprite_index);

var p=6,
bx=lerp(border[borders.left][0], border[borders.right][0]-7, windowScale),
by=border[borders.top][0]+4;

if hasButtons {
	for (var i=0; i<array_length(butt); i++) {
		var inst=butt[i];
		with inst {
			x=bx;
			y=by;
			image_xscale=other.windowScale;
			image_yscale=other.windowScale;
			depth=other.depth-1;
		}
		bx-=p;
	}
}

var w=4,
br=border[borders.right][0],
bt=border[borders.top][0],
bl=border[borders.left][0],
bb=border[borders.bottom][0];

border[borders.right][1]=[br-w, bt, br+w, bb];
border[borders.top][1]=[bl, bt-w, br, bt+w];
border[borders.left][1]=[bl-w, bt, bl+w, bb];
border[borders.bottom][1]=[bl, bb-w, br, bb+w];

portWidth=floor(windowWidth-6);
portHeight=floor(windowHeight-13);

/*
if ds_exists(children, ds_type_list) {
	for (var i=0; i<ds_list_size(children); i++) {
		instance_activate_object(children[| i]);
		with children[| i] {
			x=other.x+3+xstart;
			y=other.y+10+ystart;
			visible=false;
			parentWindow=other;
			if (xstart!=clamp(xstart, 0, other.portWidth) || ystart!=clamp(ystart, 0, other.portHeight)) && canDeactivate {
				instance_deactivate_object(self);
			}
		}
		if !instance_exists(children[| i]) {
			show_debug_message(concat("cleared #", i, " from children objects list, instance was deleted"));
			ds_list_delete(children, i);
		}
	}
}
*/
handleChildren();

if HIGHEST_INSTANCE_UNDER_MOUSE==id && input(mb_left, PRESS) {
	var d=depth;
	with window {
		if depth<d d=depth;
	}
	if d!=depth depth=d-10;
}