if live_call() return live_result;

// Inherit the parent event
event_inherited();

drawScript=function(x, y) {
	image_xscale=width/sprite_get_width(sprite_index);
	image_yscale=height/sprite_get_height(sprite_index);
	defaultDrawScript(x, y);
	var left=x-width/2,
	top=y-height/2;
	
	if coins<price {
		var xp=4,
		yp=2;
		draw_sprite_stretched(sprMinerCheckerboard, 0, left+xp, top+yp, width*.42, height-yp);
	} else {
		doShow=true;
	}
	
	var sx=left+sprite_get_xoffset(sprite)+2-12,
	sy=y+hoveringOver*wave(-1, 1, 1)*2;
	draw_sprite(sprite, 0, sx, sy);
	draw_set_font(fntSmaller);
	draw_set_halign(fa_right);
	draw_set_valign(fa_top);
	var tc=hoveringOver ? darkGreenColor : greenColor,
	tx=x+width/2,
	ty=top+4,
	t=concat(name, "\nPrice: ", price);
	draw_text_color(tx, ty, t, tc, tc, tc, tc, 1);
	draw_set_valign(fa_bottom);
	var oy=y+height/2-2,
	ot=concat("Owned: ", owned);
	draw_text_color(tx, oy, ot, tc, tc, tc, tc, 1);
}

clickFunction=function() {
	if coins>=price {
		var in=index;
		with parentWindow {
			shrimpCoins-=other.price;
			shopItems[| in][? "owned"]++;
			if shopItems[| in][? "owned"]>=50 {
				unlockMedal(shopItems[| in][? "medal"]);
			}
			updateData(shopItems[| in][? "name"]+"Owned", shopItems[| in][? "owned"]);
			saveGame();
		}
		squish=.2;
	}
}

var o=0,
in=index;
with parentWindow {
	o=shopItems[| in][? "owned"];
}
var b=(basePrice/5)*4.5;
price=ceil(basePrice+(sqr(o)/(basePrice/b)));