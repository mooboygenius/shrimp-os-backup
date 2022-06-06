if live_call() return live_result;

event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	
	switch substate {
		case 0:
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
			draw_set_font(fntSystem);
	
			draw_text_color(portWidth div 2-40, 4, concat("Are you sure you want\nto download this?:\n\n\"", fileName, "\""), BLACK_COLOR, BLACK_COLOR, BLACK_COLOR, BLACK_COLOR, 1);
	
			var spr=object_get_sprite(downloadingFile);
	
			draw_sprite_ext(spr, 0, sprite_get_xoffset(spr)+14, 28+wave(-2, 2, 2), wave(-1, 1, 1.5), 1, 0, c_white, 1);
	
			var buttonY=portHeight-14,
			buttonX=portWidth div 2,
			d=30;
			with yesButton {
				ystart=buttonY;
				xstart=buttonX-d;
				depth=other.depth-10;
			}
			with noButton {
				ystart=buttonY;
				xstart=buttonX+d;
				depth=other.depth-10;
			}
		break;
		
		case 1:
			with yesButton instance_destroy();
			with noButton instance_destroy();
			draw_set_halign(fa_center);
			draw_set_valign(fa_center);
			draw_set_font(fntSystem);
			draw_text(portWidth div 2+irandom_range(-1, 1), 22+irandom_range(-1, 1), "Downloading...\nHold on a moment...");
			var a=round(gameFrame*5/5)*5;
			draw_sprite_ext(sprDownloadingShrimp, 0, portWidth div 2, portHeight-24, 1, 1, a, c_white, 1);
			
			timer++;
			if timer>300 {
				confirmButton=instance_create_depth(-100, -100, -1000, textButton);
				with confirmButton {
					sprite_index=sprButton;
					image_xscale=3;
					lockSize=true;
					text="OK";
					clickFunction=function() {
						with parentWindow {
							state=windowStates.close;
						}
					}
				}
				ds_list_add(children, confirmButton);
				timer=0;
				substate=2;
				name="Download complete";
				
				var inst=instance_create_depth(-100, -100, 0, downloadingFile);
				var xx=20,
				yy=16;
				with inst {
					var a=0;
					while place_meeting(xx, yy, desktopFile) && a<200 {
						yy+=shiftY;
						if yy>GAME_HEIGHT-shiftY {
							yy=16;
							xx+=shiftX;
						}
						a++;
					}
					x=xx;
					y=yy;
					xScale=0;
					yScale=0;
					squish=1;
					angle=360;
					grace=5;
					nearestAcceptableX=xx;
					nearestAcceptableY=yy;
					fileName=other.fileName;
				}
			}
		break;
		
		case 2:
			draw_set_halign(fa_center);
			draw_set_valign(fa_center);
			draw_set_font(fntSystem);
			draw_text_color(portWidth div 2, 24, "Your download is complete!\nCheck your shrimptop.", BLACK_COLOR, BLACK_COLOR, BLACK_COLOR, BLACK_COLOR, 1);
			with confirmButton {
				xstart=other.portWidth div 2;
				ystart=other.portHeight-20;
			}
		break;
	}
	
	if surface_exists(childrenObjectSurf) draw_surface(childrenObjectSurf, 0, 0);
	
	surface_reset_target();
}