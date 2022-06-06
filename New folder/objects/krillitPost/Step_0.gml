if live_call() return live_result;

// Inherit the parent event
event_inherited();

drawScript=function(x, y) {
	var left=x-sprite_xoffset, top=ceil(y-sprite_yoffset);
	draw_sprite_stretched(sprKrillitOutline, 0, left, top, width, height);
	var ttx=left+40,
	tty=top+16;
	draw_sprite(thumbnail, 0, ttx, tty);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(fntSystem);
	var tx=ttx+20,
	ty=top+4,
	tw=left+width-tx,
	tsep=12,
	tc=hoveringOver ? selectColor : unselectColor;
	draw_text_ext_color(tx, ty, text, tsep, tw, tc, tc, tc, tc, 1);
	var commentsX=tx,
	commentsY=ty+string_height_ext(text, tsep, tw);
	draw_set_font(fntSmaller);
	commentCount=array_length(replies);
	var cc=$E8E0DF,
	cs=concat(commentCount, " comments");
	draw_text_color(commentsX, commentsY, cs, cc, cc, cc, cc, 1);
	var bottom=commentsY+string_height(cs);
	height=max(32, ceil(bottom-top));
	var vc=selectColor,
	vx=left+12,
	vy=floor(top+height div 2);
	draw_set_font(fntSystem);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text_color(vx, vy, votes, vc, vc, vc, vc, 1);
	image_xscale=width/sprite_get_width(sprite_index);
	image_yscale=height/sprite_get_height(sprite_index);
}

clickFunction=function() {
	var fp=noone;
	
	var r=replies;
	
	with parentWindow {
		var inst=createNewPage(krillitCommentPage);
		var fp=noone;
		
		with inst {
			
			fp=fullPost;
			
			for (var i=0; i<array_length(r); i++) {
				var rep=instance_create_depth(-100, -100, -10, krillitComment);
				rep.text=r[i];
				ds_list_add(children, rep);
				ds_list_add(replies, rep);
			}
			
		}
		
	}
	
	with fp {
		postName=other.text;
		votes=other.votes;
		image=other.fullImage;
		text=other.description;
	}
}