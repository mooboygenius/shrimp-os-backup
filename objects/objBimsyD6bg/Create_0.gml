if live_call() return live_result;

event_inherited();

won=0;

grabbed=0;

tx=51;
ty=75;

guyspd=objBimsymanager.gamespeed*0.8;
sped=0;
ysped=0;

hx=93;
hy=31;

offset=0;


drawScript=function(x,y){
	draw_sprite(sprBimsyHotdog2bg,0,0,0);
	
	if(!won){
		draw_line_width_color(32,95,tx,ty,8,$452b2b,$452b2b);
		draw_line_width_color(32,95,tx,ty,4,$7752ff,$7752ff);
		draw_sprite(sprBimsyHotdog2tongue,image_index,tx,ty);
		draw_sprite(sprBimsyHotdog2hd,image_index,hx,hy);
	}
	
	draw_sprite(sprite_index,image_index,16+offset,68);
	draw_sprite(sprBimsyHotdog2sogood,image_index,112+offset+irandom_range(0,1),16+irandom_range(0,1));
	
	
}
