if live_call() return live_result;

event_inherited();

var buffer=buffer_create(4*drawCanvasWidth*drawCanvasHeight, buffer_fixed, 1),
txt="";
buffer_get_surface(buffer, drawSurf, 0);

for (var xx=0; xx<drawCanvasWidth; xx++) {
	for (var yy=0; yy<drawCanvasHeight; yy++) {
		var pixel=buffer_peek(buffer, 4*(xx+yy*drawCanvasWidth), buffer_u32),
		r=pixel & $ff,
		g=(pixel>>8) & $ff,
		b=(pixel>>16) & $ff,
		col=make_color_rgb(r, g, b);
		
		var ch="0";
		switch col {
			case colors[0]: ch="0" break;
			case colors[1]: ch="1" break;
			case colors[2]: ch="2" break;
			case colors[3]: ch="3" break;
			case colors[4]: ch="4" break;
			case colors[5]: ch="5" break;
			case colors[6]: ch="6" break;
			case colors[7]: ch="7" break;
			case colors[8]: ch="8" break;
			case colors[9]: ch="9" break;
			case colors[10]: ch="a" break;
			case colors[11]: ch="b" break;
			case colors[12]: ch="c" break;
			case colors[13]: ch="d" break;
			case colors[14]: ch="e" break;
			case colors[15]: ch="f" break;
			case colors[16]: ch="g" break;
			case colors[17]: ch="h" break;
			case colors[18]: ch="i" break;
			case colors[19]: ch="j" break;
			case colors[20]: ch="k" break;
			case colors[21]: ch="l" break;
			case colors[22]: ch="m" break;
			case colors[23]: ch="n" break;
			case colors[24]: ch="o" break;
			case colors[25]: ch="p" break;
			case colors[26]: ch="q" break;
			case colors[27]: ch="r" break;
			case colors[28]: ch="s" break;
			case colors[29]: ch="t" break;
			case colors[30]: ch="u" break;
			case colors[31]: ch="v" break;
			case colors[32]: ch="w" break;
			case colors[33]: ch="x" break;
			case colors[34]: ch="y" break;
			case colors[35]: ch="z" break;
			case colors[36]: ch="A" break;
			case colors[37]: ch="B" break;
			case colors[38]: ch="C" break;
			case colors[39]: ch="D" break;
			case colors[40]: ch="E" break;
			case colors[41]: ch="F" break;
			case colors[42]: ch="G" break;
			case colors[43]: ch="H" break;
			case colors[44]: ch="I" break;
			case colors[45]: ch="J" break;
			case colors[46]: ch="K" break;
			case colors[47]: ch="L" break;
			case colors[48]: ch="M" break;
			case colors[49]: ch="N" break;
			case colors[50]: ch="O" break;
		}
		
		txt+=ch;
	}
	
	txt+=".";		// break
}

with myFile {
	saveInfo=txt;
}

buffer_delete(buffer);

var d=string_replace_all(txt, ".", "\n");
show_debug_message(d);

saveDesktopFiles();