if live_call() return live_result;

event_inherited();

manager=objBimsymanager;
i=0;
xpos=x;
ypos=y;
splashtext="FUCK!?";
scale=0;
life=60;

drawScript=function(x,y){
	draw_set_font(fntCommand);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	for(var i=-1; i<2; i++){
		for(var j=-1; j<2; j++){
			draw_set_colour($211f1b);
			draw_text_transformed(x+i,y+j,splashtext,scale,scale,0);
		}
	}
	
	draw_set_colour($e8fff5);
	draw_text_transformed(x,y,splashtext,scale,scale,0);
}
