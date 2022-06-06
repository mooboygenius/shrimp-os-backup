if live_call() return live_result;

event_inherited();

searchBar=instance_create_depth(-100, -100, depth-1, shrimpleSearchBar);
ds_list_add(children, searchBar);
name="Shrimple search results";

searchTerm="";

searchResultCount=0;

searchResults=-1;

generateSearchResults=function(text) {
	/// @function generateSearchResults(text)
	
	searchTerm=text;
	
	text=string_lower(string_lettersdigits(text));
	
	if ds_exists(searchResults, ds_type_list) {
		for (var i=0; i<ds_list_size(searchResults); i++) {
			with searchResults[| i] {
				instance_destroy();
			}
		}
		ds_list_destroy(searchResults);
	}
	
	searchResults=ds_list_create();
	
	if string_length(searchTerm)>2 {
		var mapSize=ds_map_size(realWebsites),
		key=ds_map_find_first(realWebsites);
	
		for (var i=0; i<mapSize; i++) {
			if string_pos(text, realWebsites[? key][? "tags"]) || string_lower(string_lettersdigits(realWebsites[? key][? "name"]))==text {
				show_debug_message(concat("HIT!:  [", i, "]: ", key));
				
				var inst=instance_create_depth(-1000, -1000, depth-20, shrimpleSearchResult),
				n=realWebsites[? key][? "name"],
				d=realWebsites[? key][? "description"];
				with inst {
					name=n;
					url=key;
					description=d;
				}
				ds_list_add(children, inst);
				ds_list_add(searchResults, inst);
				searchResultCount++;
			}
			key=ds_map_find_next(realWebsites, key);
		}
	}
}