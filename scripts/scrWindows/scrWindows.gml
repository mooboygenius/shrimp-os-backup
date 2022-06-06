function centerWindow(instance) {
	var cx=GAME_WIDTH div 2,
	cy=GAME_HEIGHT div 2;
	with instance {
		var w=windowWidth/2,
		h=windowHeight/2;
		border[borders.left][0]=ceil(cx-w);
		border[borders.top][0]=ceil(cy-h);
		border[borders.right][0]=ceil(cx+w);
		border[borders.bottom][0]=ceil(cy+h);
	}
}

function setWindowSize(instance, left, top, width, height) {
	with instance {
		var right=left+width,
		bottom=top+height;
		border[borders.left][0]=left;
		border[borders.top][0]=top;
		border[borders.right][0]=right;
		border[borders.bottom][0]=bottom;
		windowWidth=width;
		windowHeight=height;
	}
}

function getActiveWindow() {
	var d=0,
	active=noone;
	with window {
		if depth<d {
			d=depth;
			active=id;
		}
	}
	return active;
}

function refreshPortSize() {
	portWidth=floor(windowWidth-6);
	portHeight=floor(windowHeight-13);
}