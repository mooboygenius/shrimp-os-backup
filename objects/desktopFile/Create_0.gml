if live_call() return live_result;

// Inherit the parent event
event_inherited();

previousHovering=false;

fileDrawScript=function(x, y) {
	/// @function fileDrawScript(x, y)
	draw_set_font(fntSmaller);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_color(c_white);
	var tx=x, ty=y+16;
	var c=c_white,
	t=fileName;
	if state==fileState.rename {
		var r=1000;
		if current_time%r<(r/2) {
			t+="_";
		} else {
			t+=" ";
		}
		c=c_white;
		var p=1,
		w=string_width(t)/2,
		h=string_height(t)/2,
		left=tx-w,
		right=tx+w,
		top=ty-h,
		bottom=ty+h,
		bc=$996F68;
		draw_rectangle_color(left, top, right, bottom, bc, bc, bc, bc, false);
	}
	draw_text_color(tx, ty, t, c, c, c, c, 1);
}

drawScript=function(x, y) {
	defaultDrawScript(x, y);
	fileDrawScript(x, y);
}

holdTimer=0;

nearestAcceptableX=x;
nearestAcceptableY=y;

selectionBoxX=nearestAcceptableX;
selectionBoxY=nearestAcceptableY;

offsetX=20;
offsetY=16;
shiftX=40;
shiftY=40;

var inst=self;
uniqueRightClickMenuOptions=[
	createOption("Open"),
	createOption("Rename", function() {
		state=fileState.rename;
		squish=.5;
		with rightClickMenu state=menuState.close;
	}),
	createOption("Delete", function() {
		xScale=1;
		yScale=1;
		angle=0;
		state=fileState.disappear;
		squish=-.5;
		grace=2;
		with rightClickMenu state=menuState.close;
	})
];

childWindow=noone;

saveDesktopFiles();