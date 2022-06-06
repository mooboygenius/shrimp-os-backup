function createNewFile(x, y, name, type=desktopFile) {
	var inst=instance_create_depth(x, y, 0, type);
	with inst {
		fileName=name;
		nearestAcceptableX=round((x-offsetX)/shiftX)*shiftX+offsetX;
		nearestAcceptableY=round((y-offsetY)/shiftY)*shiftY+offsetY;
		var l=1;
		selectionBoxX=lerp(selectionBoxX, nearestAcceptableX, l);
		selectionBoxY=lerp(selectionBoxY, nearestAcceptableY, l);
		xScale=0;
		yScale=0;
		angle=180;
	}
	return inst;
}