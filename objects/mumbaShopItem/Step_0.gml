if live_call() return live_result;

event_inherited();

if active {
	if input(mumbaInputJump, PRESS) || input(mumbaInputFire, PRESS) {
		show_debug_message("attempting to use");
		
		var m=0;
		with mumbaPlayerData {
			m=money;
		}
		
		if !stock {
			with mumbaWindow cameraShake=2;
			with mumbaShopController {
				setTextBubbleText(other.outOfStockText);
				keeper.sprite_index=cantBuySprite;
				keeper.squish=.1;
			}
			playSound(sfxMumbaShopCantBuyItem);
			squish=-.1;
			show_debug_message("can't buy -- out of stock");
		} else if m>=price {
			show_debug_message("can buy");

			grace=10;
			squish=.2;	
				
			with mumbaWindow cameraShake=1;
			with mumbaPlayerData {
				money-=other.price;
				updateData("mumbaMoney", money);
			}
			with mumbaShopController {
				setTextBubbleText(other.buyText);
				keeper.sprite_index=greetingSprite;
				keeper.squish=-.1;
			}
			stock--;
			if !stock {
				color=outOfStockColor;
			}
			
			playSound(sfxMumbaShopBuyItem);
				
			buyScript();
				
			saveGame();
		} else {
			with mumbaWindow cameraShake=2;
			with mumbaShopController {
				setTextBubbleText(other.cantBuyText);
				keeper.sprite_index=cantBuySprite;
				keeper.squish=.1;
			}
			playSound(sfxMumbaShopCantBuyItem);
			squish=-.1;
			show_debug_message("not enough money");
		}
	}
}

with parentWindow {
	other.drawX+=random_range(-cameraShake, cameraShake);
	other.drawY+=random_range(-cameraShake, cameraShake);
}

drawScript=function(x, y) {
	image_index=active;
	var textColor=active ? BLACK_COLOR : WHITE_COLOR,
	backColor=color,
	w=1;
	if active w=wave(-1, 1, 1);
	itemXScale=lerp(itemXScale, w, .5);
	if grace<0 setSwapAmountShader(backColor, defaultColor, .2, 1) else setSwapAmountShader(c_white, c_white, 1, 1);
	defaultDrawScript(drawX, drawY);
	if grace<0 shader_reset();
	draw_set_font(font);
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	var tx=ceil(drawX-sprite_xoffset+3*textScale);
	if sprite_exists(sprite) && stock {
		var sa=2,
		sxo=sprite_get_xoffset(sprite),
		sx=drawX-sprite_xoffset+sa,
		sy=drawY-1;
		if active sy+=wave(-1, 1, .5)*2;
		draw_sprite_ext(sprite, 0, sx, sy, itemXScale, 1, 0, c_white, 1);
		tx+=sxo;
	}
	if !stock {
		var o=4,
		left=drawX-sprite_xoffset+o,
		right=left+string_width(name)+4;
		draw_line_color(left, drawY, right, drawY, textColor, textColor);
		tx+=4;
	}
	var ty=drawY+textYOffset;
	draw_text_transformed_color(tx, ty, name, xScale*textScale, yScale, 0, textColor, textColor, textColor, textColor, 1);
	if price>0 && stock {
		draw_set_halign(fa_right);
		var mx=ceil(drawX+sprite_xoffset);
		draw_text_color(mx-3, ty, concat("$*", price), textColor, textColor, textColor, textColor, 1);
	}
	shader_reset();
}