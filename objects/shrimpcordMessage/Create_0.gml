if live_call() return live_result;

event_inherited();

var m="AM";
if hour>=12 m="PM";
hour=hour%12;
if hour==0 hour=12;
timeFormat=function(str) {
	/// @function timeFormat(str)
	return string_replace_all(string_format(str, 2, 0), " ", "0");
}
time=concat(timeFormat(hour), ":", timeFormat(minute), " ", m);
nameColor=c_white;
textColor=$E8E0DF;
timeColor=$996F68;
maxWidth=100;
breakHeight=0;
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
	var top=py-8, bottom=ty+string_height_ext(text, sep, maxWidth);
	breakHeight=max(point_distance(top, 0, bottom, 0), 24);
}