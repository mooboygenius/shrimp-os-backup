if live_call() return live_result;

event_inherited();

var w=sprite_get_width(sprDefaultShteamThumbnail),
h=sprite_get_height(sprDefaultShteamThumbnail),
xs=0,
ys=h div 2+4+12+scrollYLerp,
xx=xs,
yy=ys,
p=5,
n=0,
yJump=54;
for (var i=0; i<ds_list_size(games); i++) {
	with games[| i] {
		xx=other.portWidth div 2+(sprite_width+8)*n;
		var l=1;
		xstart=lerp(xstart, xx, l);
		ystart=lerp(ystart, yy, l);
		depth=other.depth-10;
		xx+=sprite_xoffset;
	}
	
	if i==0 {
		yy+=yJump;
		n=-1;
	}
	
	if i>0 {
		n++;
		if n>1 {
			n=-1;
			yy+=yJump;
		}
	}
}

var in=(mouse_wheel_up()-mouse_wheel_down())*16;
if in!=0 {
	scrollY+=in;
}
scrollY=clamp(scrollY, -80, 0);
scrollYLerp=lerp(scrollYLerp, scrollY, .5);