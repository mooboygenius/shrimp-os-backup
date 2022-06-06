if live_call() return live_result;

event_inherited();

if(!created){
	created=1;
	ds_list_add(elements,createWindowInstance(33,70,depth,objBimsyDeadshot,parentWindow));	
	ds_list_add(elements,createWindowInstance(33,70,depth,objBimsyDeadjules,parentWindow));	
	
	ds_list_add(elements,createWindowInstance(360,irandom_range(40,80),depth,objBimsyDeadworm,parentWindow));	
	ds_list_add(elements,createWindowInstance(320,irandom_range(40,80),depth,objBimsyDeadworm,parentWindow));	
	ds_list_add(elements,createWindowInstance(280,irandom_range(40,80),depth,objBimsyDeadworm,parentWindow));	
	ds_list_add(elements,createWindowInstance(240,irandom_range(40,80),depth,objBimsyDeadworm,parentWindow));	
	ds_list_add(elements,createWindowInstance(200,irandom_range(40,80),depth,objBimsyDeadworm,parentWindow));
	ds_list_add(elements,createWindowInstance(160,irandom_range(40,80),depth,objBimsyDeadworm,parentWindow));	
	ds_list_add(elements,createWindowInstance(120,irandom_range(40,80),depth,objBimsyDeadworm,parentWindow));	
	
	ds_list_add(elements,createWindowInstance(0,0,depth,objBimsyM8bg,parentWindow));	
	
}

