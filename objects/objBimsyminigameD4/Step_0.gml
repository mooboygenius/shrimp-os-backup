if live_call() return live_result;

event_inherited();

if(!created){
	created=1;	
	ds_list_add(elements,createWindowInstance(32,87,depth,objBimsyMazecursor,parentWindow));
	ds_list_add(elements,createWindowInstance(0,0,depth,objBimsyMazewalls,parentWindow));	
	ds_list_add(elements,createWindowInstance(0,0,depth,objBimsyD4bg,parentWindow));	
	
}
