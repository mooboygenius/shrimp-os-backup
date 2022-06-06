if live_call() return live_result;

// Inherit the parent event
event_inherited();

drawScript=function(x, y) {
	var px=x, py=y;
	draw_sprite(profileImage, 0, px, py);
	var nx=px+16, ny=py-11;
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(fntShrimpcordUsername);
	draw_text_color(nx, ny, name, nameColor, nameColor, nameColor, nameColor, 1);
	var timeX=nx+string_width(name)+4,
	timeY=ny+4;
	draw_set_font(fntSmaller);
	draw_text_color(timeX, timeY, time, timeColor, timeColor, timeColor, timeColor, 1);
	draw_set_font(fntSystem);
	var ty=ny+12,
	sep=12;
	draw_text_ext_color(nx, ty, text, sep, maxWidth, textColor, textColor, textColor, textColor, 1);
	var yo=ty+string_height_ext(text, sep, maxWidth)+4+sprite_get_yoffset(sprShrimpcordDownload);
	draw_sprite(sprShrimpcordDownload, hoveringOver, nx+sprite_get_xoffset(sprShrimpcordDownload), yo);	
	yo+=sprite_get_yoffset(sprShrimpcordDownload);
	var top=py-8, bottom=yo;

	breakHeight=max(point_distance(top, 0, bottom, 0), 24);
	image_xscale=6;
	image_yscale=1.5;
}

clickFunction=function() {
	createDownloadWindow(jacksGameIcon, "JAC'KS GAME");
}