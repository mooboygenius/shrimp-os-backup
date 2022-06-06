if live_call() return live_result;

event_inherited();

sprite_index=sprWindowMaximizeButton;

clickFunction=function() {
	with parentWindow {
		originalRight=border[borders.right][0];
		originalTop=border[borders.top][0];
		originalLeft=border[borders.left][0];
		originalBottom=border[borders.bottom][0];
		border[borders.left][0]=0;
		border[borders.top][0]=0;
		border[borders.right][0]=GAME_WIDTH;
		border[borders.bottom][0]=GAME_HEIGHT-sprite_get_height(sprTaskbar);
	}
}