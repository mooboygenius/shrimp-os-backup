if live_call() return live_result;

event_inherited();

if(!created){
	created=1;		
	ds_list_add(elements,createWindowInstance(5,-170,depth,objBimsyAvoidbolt,parentWindow));	
	ds_list_add(elements,createWindowInstance(5,-120,depth,objBimsyAvoidbolt,parentWindow));	
	ds_list_add(elements,createWindowInstance(5,-70,depth,objBimsyAvoidbolt,parentWindow));	
	ds_list_add(elements,createWindowInstance(5,-20,depth,objBimsyAvoidbolt,parentWindow));	
	ds_list_add(elements,createWindowInstance(39,71,depth,objBimsyAvoidcat,parentWindow));	
	ds_list_add(elements,createWindowInstance(1,1,depth,objBimsyD2bg,parentWindow));	
}
