if live_call() return live_result;

if !instance_exists(sdCloudGenerator) instance_create_depth(0, 0, 0, sdCloudGenerator);
if !instance_exists(sdPlayer) instance_create_depth(GAME_WIDTH div 2, GAME_HEIGHT-64, -10, sdPlayer);

waves=ds_list_create();

addEnemy=function() {
	/// @function addEnemy([object1], [object2], [object3]...)
	for (var i=0; i<argument_count; i++) {
		var in=ds_list_size(waves)-1,
		rin=ds_list_size(waves[| in])-1;
	
		ds_list_add(waves[| in][| rin][? "enemies"], argument[i]);
	}
}

#macro SD_ROW_PAD 32
#macro SD_ROW_START 24
#macro SD_DEFAULT_PADDING 32

addRow=function(padding=SD_DEFAULT_PADDING, left=padding, right=GAME_WIDTH-padding) {
	/// @function addRow()
	var in=ds_list_size(waves)-1,
	r=ds_list_create();
	
	ds_list_add(waves[| in], r);
	
	var rin=ds_list_size(waves[| in])-1;
	
	waves[| in][| rin]=ds_map_create();
	
	waves[| in][| rin][? "padding"]=padding;
	waves[| in][| rin][? "leftMargin"]=left;
	waves[| in][| rin][? "rightMargin"]=right;
	waves[| in][| rin][? "y"]=SD_ROW_START+rin*SD_ROW_PAD;
	waves[| in][| rin][? "enemies"]=ds_list_create();
}

addWave=function() {
	/// @function addWave()
	var w=ds_list_create();
	
	ds_list_add(waves, w);
}

arrangeWaves=function(index) {
	/// @function arrangeWaves(index)
	
	var i=index;
	
	for (var r=0; r<ds_list_size(waves[| i]); r++) {
		var left=waves[| i][| r][? "leftMargin"],
		right=waves[| i][| r][? "rightMargin"],
		ey=waves[| i][| r][? "y"],
		enemies=waves[| i][| r][? "enemies"],
		es=ds_list_size(enemies);
			
		for (var e=0; e<es; e++) {
			waves[| i][| r][? "enemies"][| e]=instance_create_depth(-100, -ey, -10, waves[| i][| r][? "enemies"][| e]);
				
			with waves[| i][| r][? "enemies"][| e] {
				show_debug_message("ball is life");
				var l=e/(es-1);
				if es<2 l=.5;
				gotoX=lerp(left, right, l);
				show_debug_message(concat("left: ", left, "  right: ", right));
				show_debug_message(concat("gotoX: ", gotoX));
				x=gotoX;
				gotoY=ey;
				y=-gotoY-160;
			}
		}
	}
}

currentWave=0;
state=0;
timer=0;
showText=false;
text="";