if live_call() return live_result;

event_inherited();

setWindowSize(self, x, y, 156, 109);
centerWindow(self);

instance_destroy(butt[1]);
instance_destroy(butt[2]);

scrollx=0;
scrolly=0;

holding=0;
mus=musJerr;

mandalascale=0;

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
