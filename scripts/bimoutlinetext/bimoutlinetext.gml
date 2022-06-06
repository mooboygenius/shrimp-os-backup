// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function bimoutlinetext(xp,yp,str,colour,outline){
	draw_set_colour(outline);
	for(var i=0; i<3; i++){
		for(var j=0; j<3; j++){
			draw_text(xp-1+i,yp-1+j,str);	
		}
	}
	
	draw_set_colour(colour);
	draw_text(xp,yp,str);
}