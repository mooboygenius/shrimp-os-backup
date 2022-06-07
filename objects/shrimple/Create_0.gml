if live_call() return live_result;

event_inherited();

searchBar=instance_create_depth(-100, -100, depth-1, shrimpleSearchBar);
ds_list_add(children, searchBar);

searchButton=instance_create_depth(-100, -100, depth-1, textButton);
ds_list_add(children, searchButton);

with searchButton {
	canDeactivate=false;
	text="Shearch";
	parentWindow=other;
	clickFunction=function() {
		var inst=noone,
		t="";
		
		with parentWindow {
			for (var i=0; i<ds_list_size(children); i++) {
				if children[| i].object_index==shrimpleSearchBar {
					t=children[| i].text;
					show_debug_message(t);
					break;
				}
			}
			inst=createNewPage(shrimpleSearch);
		}
		
		with inst {
			generateSearchResults(t);
		}
	}
}

if !loadData("visitedShrimple", false) || chance(.1) {
	with createShrimpy("Shrimple is a powerful tool for finding new shrimpsites. Type in a short word or phrase and see if anything comes up!") {
		destroyScript=function() {
			timer++;
			if timer>600 state=1;
		}
	}
	updateData("visitedShrimple", true);
	saveGame();
}