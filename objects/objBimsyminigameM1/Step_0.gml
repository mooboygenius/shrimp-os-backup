if live_call() return live_result;

event_inherited();

if(!created){
	created=1;

	ds_list_add(elements,createWindowInstance(64,71,depth,objBimsyParallelguy,parentWindow));	
	
	ds_list_add(elements,createWindowInstance(0,irandom_range(0,128),depth,objBimsyParallelbullet,parentWindow));	
	ds_list_add(elements,createWindowInstance(irandom_range(0,128),0,depth,objBimsyParallelbullet,parentWindow));	
	ds_list_add(elements,createWindowInstance(irandom_range(0,128),128,depth,objBimsyParallelbullet,parentWindow));	
	ds_list_add(elements,createWindowInstance(128,irandom_range(0,128),depth,objBimsyParallelbullet,parentWindow));	
	
	ds_list_add(elements,createWindowInstance(0,0,depth,objBimsyM1bg,parentWindow));	
	
}
