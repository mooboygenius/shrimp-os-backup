if live_call() return live_result;

event_inherited();

setWindowSize(self, x, y, 192+6, 128+13);
centerWindow(self);

instance_destroy(butt[1]);
instance_destroy(butt[2]);

booksprite=sprUserguidepages;
pageindex=0;

sprite_index=booksprite;
pages=image_number;

sprite_index=sprFilledWindowFrame;

flipping=0;
flippingr=0;
pagescale=1;
halfway=0;

pagel=0;
pager=1;
pageln=0;
pagern=0;

handleChildren=function() {
	/// @function handleChildren()
	if ds_exists(children, ds_type_list) {
		for (var i=0; i<ds_list_size(children); i++) {
			instance_activate_object(children[| i]);
			with children[| i] {
				visible=false;
				if other.enableAutomaticDepthSort {
					depth=other.depth-1;
				}
				parentWindow=other;
			}
			
			if !instance_exists(children[| i]) {
				ds_list_delete(children, i);
			}
		}
	}
}
