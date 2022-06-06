if live_call() return live_result;
event_inherited();

var lx=portWidth div 2,
ly=64,
o=55,
size=ds_list_size(links);
for (var i=0; i<size; i++) {
	with links[| i] {
		xstart=lx;
		ystart=ly;
		if i<size-1 {
			if i%2==0 {
				xstart+=-sprite_width/2+o;
			} else {
				xstart+=sprite_width/2-o;
			}
		}
		font=fntSmaller;
	}
	if i%2==1 {
		ly+=12;
	}
}