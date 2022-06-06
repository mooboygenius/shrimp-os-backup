// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function bimwraptext(str,maxwidth){
	var len=string_length(str);
	var last_space=1;
	var count=1;
	var sub="";
	repeat(len){
		sub=string_copy(str,1,count);
		if(string_char_at(str,count)==" "){
			last_space=count;
		}		
		if(string_width(sub)>maxwidth){
			str=string_delete(str,last_space,1);	
			str=string_insert("\n",str,last_space);	
			count++;
		}
		count++;
	}
	
	return str;
}