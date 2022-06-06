if live_call() return live_result;

event_inherited();

clickFunction=function() {
	with parentWindow {
		border[borders.left][0]=originalLeft;
		border[borders.top][0]=originalTop;
		border[borders.right][0]=originalRight;
		border[borders.bottom][0]=originalBottom;
	}
}