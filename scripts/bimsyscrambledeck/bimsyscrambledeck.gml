// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function bimsyscrambledeck(){
	for(var i=0; i<array_length(objBimsymanager.minigamedeck); i++){
		var r = irandom_range(0, array_length(objBimsymanager.minigamedeck)-1);
		var c=objBimsymanager.minigamedeck[r];
		objBimsymanager.minigamedeck[r]=objBimsymanager.minigamedeck[i];
		objBimsymanager.minigamedeck[i]=c;
	}
	
}