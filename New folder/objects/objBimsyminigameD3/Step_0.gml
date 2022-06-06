if live_call() return live_result;

event_inherited();

if(!created){
	created=1;
	ds_list_add(elements,createWindowInstance(irandom_range(33,95),20,depth,objBimsyFitinclaw,parentWindow));	
	ds_list_add(elements,createWindowInstance(irandom_range(17,77),78,depth,objBimsyFitinhole,parentWindow));	
	ds_list_add(elements,createWindowInstance(0,0,depth,objBimsyD3bg,parentWindow));	
	
}
