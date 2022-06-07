if live_call() return live_result;

event_inherited();

playingNow=false;

var nm=name;

var flat=false,
sharp=false;
if mode==noteMode.flat {
	flat=true;
} else if mode==noteMode.sharp {
	sharp=true;
}

switch ystart {
	case 3:
		if sharp nm+="DE3" else if flat nm+="CD2" else nm+="D2";
	break;
	
	case 10:
		if sharp nm+="CD2" else if flat {
			nm+="C2";
			mode=noteMode.normal;
		} else nm+="C2";
	break;
	
	case 17:
		if sharp {
			nm+="B2";
			mode=noteMode.normal;
		} else if flat nm+="AB2" else nm+="B2";
	break;
	
	case 24:
		if sharp nm+="AB2" else if flat nm+="GA2" else nm+="A2";
	break;
	
	case 31:
		if sharp nm+="GA2" else if flat nm+="FG2" else nm+="G2";
	break;
	
	case 38:
		if sharp nm+="FG2" else if flat {
			nm+="F2";
			mode=noteMode.normal;
		} else nm+="F2";
	break;
	
	case 45:
		if sharp {
			nm+="E2";
			mode=noteMode.normal;
		} else if flat nm+="DE2" else nm+="E2";
	break;
	
	case 52:
		if sharp nm+="DE2" else if flat nm+="CD1" else nm+="D1";
	break;
	
	case 59:
		if sharp nm+="CD1" else if flat {
			nm+="C1";
			mode=noteMode.normal;
		} else nm+="C1";
	break;
	
	case 66:
		if sharp {
			nm+="B1";
			mode=noteMode.normal;
		} else if flat nm+="AB1" else nm+="B1";
	break;
	
	case 73:
		if sharp nm+="AB1" else if flat nm+="GA1" else nm+="A1";
	break;
	
	case 80:
		if sharp nm+="GA1" else if flat nm+="FG1" else nm+="G1";
	break;
	
	case 87:
		if sharp nm+="FG1" else if flat {
			nm+="F1";
			mode=noteMode.normal;
		} else nm+="F1";
	break;
	
	case 94:
		if sharp {
			nm+="E1";
			mode=noteMode.normal;
		} else if flat nm+="DE1" else nm+="E1";
	break;
}

startX=xstart;
startY=ystart;
scrollX=0;
scrollY=0;
xScale=2;
yScale=xScale;

asset=asset_get_index(nm);
if !audio_exists(asset) {
	asset=sfxCatD1;
}
yOffset=-2;
enum noteMode {normal, sharp, flat}
switch mode {
	case noteMode.normal:
		drawScript=function(x, y) {
			y+=yOffset;
			defaultDrawScript(x, y);
		}
	break;
	
	case noteMode.sharp:
		drawScript=function(x, y) {
			y+=yOffset;
			defaultDrawScript(x, y);
			draw_sprite(sprInstSharpIcon, 0, x+sprite_xoffset, y-sprite_yoffset);
		}
	break;
	
	case noteMode.flat:
		drawScript=function(x, y) {
			y+=yOffset;
			defaultDrawScript(x, y);
			draw_sprite(sprInstFlatIcon, 0, x+sprite_xoffset, y-sprite_yoffset);
		}
	break;
}

image_speed=0;