function createOption(label, func=function() {}, drawFunction=function() {}) {
	/// @function createOption(label, [function], [drawFunction])
	return [label, false, 0, func, drawFunction];
}

function setMenuOptions(optionArray) {
	options=-1;
	options=optionArray;
	draw_set_font(fntSystem);
	numberOfOptions=array_length(options);
	lineBreakHeight=14;
	windowPadHeight=4;
	windowPadWidth=ceil(windowPadHeight*1.25);
	windowHeight=windowPadHeight*2+lineBreakHeight*numberOfOptions;
	var maxWidth=32;
	for (var i=0; i<numberOfOptions; i++) {
		maxWidth=max(maxWidth, string_width(options[i][optionData.label]));
	}
	windowWidth=windowPadWidth*2+maxWidth;
}