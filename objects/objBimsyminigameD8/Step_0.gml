if live_call() return live_result;

event_inherited();

if(!created){
	created=1;	
	ds_list_add(elements,createWindowInstance(280,irandom_range(20,100),depth,objBimsyGamiocone,parentWindow));	
	ds_list_add(elements,createWindowInstance(230,irandom_range(20,100),depth,objBimsyGamiocone,parentWindow));	
	ds_list_add(elements,createWindowInstance(170,irandom_range(20,100),depth,objBimsyGamiocone,parentWindow));	
	ds_list_add(elements,createWindowInstance(120,irandom_range(20,100),depth,objBimsyGamiocone,parentWindow));	
	ds_list_add(elements,createWindowInstance(30,48,depth,objBimsyGamiokart,parentWindow));	
	ds_list_add(elements,createWindowInstance(0,0,depth,objBimsyD8bg,parentWindow));	
	
}
