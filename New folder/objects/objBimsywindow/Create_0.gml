if live_call() return live_result;

audio_group_stop_all(bgm);

event_inherited();

setWindowSize(self, x, y, 134, 141);
centerWindow(self);
firesound=0;

if(instance_number(objBimsywindow)<=1){
	manager=instance_create_depth(-100, -100, depth+1, objBimsymanager);
	ds_list_add(children, manager);
	
	ds_list_add(children, instance_create_depth(1, 1, depth+1, objBimsymenu));

	unlockMedal("Amen!");

	

}else{
	ds_list_add(children, instance_create_depth(1, 1, depth+2, objBimsyerror));
	ds_list_add(children, instance_create_depth(64, 64, depth+1, objBimsyangel));
	firesound=playSound(musBimsyfire,1,1,1);
	playSound(sndVBimsyAwjeez,1,1,0);
	unlockMedal("Aw jeez!");
}

instance_destroy(butt[1]);
instance_destroy(butt[2]);

random_set_seed(current_time);
randomize();

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