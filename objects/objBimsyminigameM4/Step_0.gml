if live_call() return live_result;

event_inherited();

if(!created){
	created=1;
	
	ds_list_add(elements,createWindowInstance(26,60,depth,objBimsySTDbullet,parentWindow));
	ds_list_add(elements,createWindowInstance(26,70,depth,objBimsySTDchester,parentWindow));
	ds_list_add(elements,createWindowInstance(120,70,depth,objBimsySTDenemy,parentWindow));
	ds_list_add(elements,createWindowInstance(0,0,depth,objBimsyM4bg,parentWindow));	
	
}

