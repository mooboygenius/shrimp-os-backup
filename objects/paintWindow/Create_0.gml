if live_call() return live_result;

event_inherited();

var w=180, h=3/4*w;
setWindowSize(self, x, y, w, h);

colors=[
make_color_rgb(33, 24, 27),			// 1
make_color_rgb(59, 32, 39),			// 2
make_color_rgb(125, 56, 51),		
make_color_rgb(171, 81, 48),
make_color_rgb(207, 117, 43),		//5
make_color_rgb(240, 181, 65),
make_color_rgb(255, 238, 131),
make_color_rgb(200, 212, 93),
make_color_rgb(99, 171, 63),
make_color_rgb(59, 125, 79),		// 10
make_color_rgb(47, 87, 43),
make_color_rgb(40, 53, 64),
make_color_rgb(27, 31, 33),
make_color_rgb(43, 43, 69),
make_color_rgb(43, 43, 69),			// 15
make_color_rgb(58, 63, 94),
make_color_rgb(58, 63, 94),
make_color_rgb(76, 104, 133),
make_color_rgb(40, 53, 64),
make_color_rgb(40, 53, 64),			// 20
make_color_rgb(27, 31, 33),
make_color_rgb(43, 43, 69),
make_color_rgb(58, 63, 94),
make_color_rgb(76, 104, 133),
make_color_rgb(79, 164, 184),		// 25
make_color_rgb(146, 232, 192),
make_color_rgb(245, 255, 232),
make_color_rgb(223, 224, 232),
make_color_rgb(163, 167, 194),
make_color_rgb(104, 111, 153),		// 30
make_color_rgb(64, 73, 115),
make_color_rgb(44, 53, 77),
make_color_rgb(20, 24, 46),
make_color_rgb(75, 29, 82),
make_color_rgb(105, 36, 100),		// 35
make_color_rgb(156, 42, 112),
make_color_rgb(204, 47, 123),
make_color_rgb(255, 82, 119),
make_color_rgb(255, 194, 161),
make_color_rgb(255, 137, 51),		// 40
make_color_rgb(230, 69, 57),
make_color_rgb(173, 47, 69),
make_color_rgb(120, 29, 79),
make_color_rgb(79, 29, 76),
make_color_rgb(41, 29, 43),			// 45
make_color_rgb(61, 41, 54),
make_color_rgb(82, 51, 63),
make_color_rgb(143, 77, 87),
make_color_rgb(189, 106, 98),
make_color_rgb(255, 174, 112),		// 50
c_white								// 51
];

var sx=3, sy=10,
xx=sx, yy=sy,
o=8;

barWidth=32;
for (var i=0; i<array_length(colors); i++) {
	var inst=instance_create_depth(xx, yy, depth-1, colorButton);
	with inst {
		parent=other;
		image_blend=other.colors[i];
	}
	ds_list_add(children, inst);
	xx+=o;
	if xx>barWidth {
		xx=sx;
		yy+=o;
	}
}

drawCanvasWidth=150;
drawCanvasHeight=drawCanvasWidth;
drawSurf=surface_create(drawCanvasWidth, drawCanvasHeight);
surface_set_target(drawSurf);
draw_clear_alpha(c_white, 1);
surface_reset_target();
drawColor=BLACK_COLOR;
drawSize=2;
drawX=getMouseX();
drawY=getMouseY();
drawPreviousX=-999;
drawPreviousY=-999;
timeSinceLiftingPencil=999;

loadFileData=function(str) {
	drawCanvasWidth=150;
	drawCanvasHeight=drawCanvasWidth;
	
	if !surface_exists(drawSurf) {
		drawSurf=surface_create(drawCanvasWidth, drawCanvasHeight);
	}
	
	surface_set_target(drawSurf);
	draw_clear_alpha(c_white, 1);
	
	var p=1,
	xx=0,
	yy=0;
	
	//show_debug_message(string_length(str));
	
	while (p<string_length(str)) {
		//show_debug_message(p);
		
		var ch=string_char_at(str, p),
		col=-1;
		switch ch {
			case "0": col=colors[0] break;
			case "1": col=colors[1] break;
			case "2": col=colors[2] break;
			case "3": col=colors[3] break;
			case "4": col=colors[4] break;
			case "5": col=colors[5] break;
			case "6": col=colors[7] break;
			case "7": col=colors[7] break;
			case "8": col=colors[8] break;
			case "9": col=colors[9] break;
			case "a": col=colors[10] break;
			case "b": col=colors[11] break;
			case "c": col=colors[12] break;
			case "d": col=colors[13] break;
			case "e": col=colors[14] break;
			case "f": col=colors[15] break;
			case "g": col=colors[16] break;
			case "h": col=colors[17] break;
			case "i": col=colors[18] break;
			case "j": col=colors[19] break;
			case "k": col=colors[20] break;
			case "l": col=colors[21] break;
			case "m": col=colors[22] break;
			case "n": col=colors[23] break;
			case "o": col=colors[24] break;
			case "p": col=colors[25] break;
			case "q": col=colors[26] break;
			case "r": col=colors[27] break;
			case "s": col=colors[28] break;
			case "t": col=colors[29] break;
			case "u": col=colors[30] break;
			case "v": col=colors[31] break;
			case "w": col=colors[32] break;
			case "x": col=colors[33] break;
			case "y": col=colors[34] break;
			case "z": col=colors[35] break;
			case "A": col=colors[36] break;
			case "B": col=colors[37] break;
			case "C": col=colors[38] break;
			case "D": col=colors[39] break;
			case "E": col=colors[40] break;
			case "F": col=colors[41] break;
			case "G": col=colors[42] break;
			case "H": col=colors[43] break;
			case "I": col=colors[44] break;
			case "J": col=colors[45] break;
			case "K": col=colors[46] break;
			case "L": col=colors[47] break;
			case "M": col=colors[48] break;
			case "N": col=colors[49] break;
			case "O": col=colors[50] break;
			
			case ".":
				xx=0;
				yy++;
			break;
		}
		
		p++;
		
		if col!=-1 {
			draw_point_color(yy, xx, col);
			xx++;
		}
	}
	
	surface_reset_target();
}