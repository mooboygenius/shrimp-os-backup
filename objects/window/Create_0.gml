if live_call() return live_result;

event_inherited();

var d=depth;
with window {
	if depth<d d=depth;
}
depth=d-20;

if hasButtons {
	butt[0]=instance_create_depth(x, y, depth-1, windowCloseButton);
	butt[1]=instance_create_depth(x, y, depth-1, windowMaximizeButton);
	butt[2]=instance_create_depth(x, y, depth-1, windowMinimizeButton);
	for (var i=0; i<array_length(butt); i++) {
		with butt[i] parentWindow=other.id;
	}
}


enum borders {right, top, left, bottom}

border[borders.right][0]=x+sprite_width;
border[borders.right][1]=[x, y, x, y];

border[borders.top][0]=y;
border[borders.top][1]=[x, y, x, y];

border[borders.left][0]=x;
border[borders.left][1]=[x, y, x, y];

border[borders.bottom][0]=y+sprite_height;
border[borders.bottom][1]=[x, y, x, y];

var sl=.2;
windowWidth=border[borders.right][0]-border[borders.left][0];
windowHeight=border[borders.bottom][0]-border[borders.top][0];

dragLeft=x;
dragTop=y;
dragRight=x;
dragBottom=y;

pullingBorder=-1;

state=windowStates.opening1;

originalRight=border[borders.right][0];
originalTop=border[borders.top][0];
originalLeft=border[borders.left][0];
originalBottom=border[borders.bottom][0];

backgroundSurface=-1;
childrenObjectSurf=-1;
finalSurf=-1;
storeFinalSurf=-1;
windowScale=0;

portWidth=windowWidth;
portHeight=windowHeight;
oldPortWidth=portWidth;
oldPortHeight=portHeight;
portX=0;
portY=0;

children=ds_list_create();
grace=2;

drawScript=function(x, y) {
	draw_sprite_stretched(sprite_index, 0, x, y, windowWidth*windowScale, windowHeight*windowScale);
}

drawShadowScript=function(x, y) {
	drawScript(x, y);
}

handleChildren=function() {
	/// @function handleChildren()
	if ds_exists(children, ds_type_list) {
		for (var i=0; i<ds_list_size(children); i++) {
			instance_activate_object(children[| i]);
			with children[| i] {
				x=other.x+3+xstart;
				y=other.y+10+ystart;
				visible=false;
				if other.enableAutomaticDepthSort {
					depth=other.depth-1;
				}
				parentWindow=other;
				
				if (xstart!=clamp(xstart, 0, other.portWidth) || ystart!=clamp(ystart, 0, other.portHeight)) && canDeactivate {
					instance_deactivate_object(self);
				}
			}
			if !instance_exists(children[| i]) {
				ds_list_delete(children, i);
			}
		}
	}
}

loadFileData=function(str) {
	/// @function loadFileData(string)
}