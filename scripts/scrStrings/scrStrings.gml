function concat() {
	/// @function concat(string1, string2, string3...)
	var str="";
	for (var i=0; i<argument_count; i++) {
		str+=string(argument[i]);
	}
	return str;
}

function characterIsReal(str) {
	return string_pos(str, "QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm1234567890-=`~!@#$%^&*()_+[]\\{}|;':\",./<>? ");
}

function getStringInput(text, allowLinebreaks=true, backSpeed=2, backMinimum=20) {
	static backing=0;
	
	var current=string_length(text);
	
	if input(vk_backspace) {
		if (backing>backMinimum && backing%backSpeed==0) || backing==0 {
			text=string_delete(text, current, 1); 
		}
		backing++;
	}
	
	if input(vk_backspace, RELEASE) {
		backing=0;
	}
	
	if keyboard_check_pressed(vk_anykey) {
		switch keyboard_key {
			case vk_backspace:
				// do nothing
			break;
				
			case vk_shift:
				// do nothing
			break;
				
			case vk_enter:
				if allowLinebreaks {
					text+="\n";
				}
			break;
				
			default:
				var cin=keyboard_lastchar;
				show_debug_message(concat("cin: ", cin));
				if characterIsReal(cin) text+=cin;
			break;
		}
	}
	return text;
}

function getStringFromInput(in) {
	// vk_constants
	//Left
	if argument0 = (vk_left)
	{
	    return "LEFT";
	}

	//Right
	if argument0 = (vk_right)
	{
	    return "RIGHT";
	}

	//Up
	if argument0 = (vk_up)
	{
	    return "UP";
	}

	//Down
	if argument0 = (vk_down)
	{
	    return "DOWN";
	}

	//Enter
	if argument0 = (vk_enter)
	{
	    return "ENTER";
	}

	//Escape
	if argument0 = (vk_escape)
	{
	    return "ESC";
	}

	//Space
	if argument0 = (vk_space)
	{
	    return "SPACE";
	}

	//Shift
	if argument0 = (vk_shift)
	{
	    return "SHIFT";
	}

	//Control
	if argument0 = (vk_control)
	{
	    return "CTRL";
	}

	//Alt
	if argument0 = (vk_alt)
	{
	    return "ALT";
	}

	//Backspace
	if argument0 = (vk_backspace)
	{
	    return "BACKSPACE";
	}

	//Tab
	if argument0 = (vk_tab)
	{
	    return "TAB";
	}

	//Home
	if argument0 = (vk_home)
	{
	    return "HOME";
	}

	//End
	if argument0 = (vk_end)
	{
	    return "END";
	}

	//Delete
	if argument0 = (vk_delete)
	{
	    return "DEL";
	}

	//Insert
	if argument0 = (vk_insert)
	{
	    return "INS";
	}

	//Page Up
	if argument0 = (vk_pageup)
	{
	    return "PG UP";
	}

	//Page Down
	if argument0 = (vk_pagedown)
	{
	    return "PG DOWN";
	}

	//Pause
	if argument0 = (vk_pause)
	{
	    return "PAUSE";
	}

	//Printscreen
	if argument0 = (vk_printscreen)
	{
	    return "PRT SC";
	}

	//F1
	if argument0 = (vk_f1)
	{
	    return "F1";
	}

	//F2
	if argument0 = (vk_f2)
	{
	    return "F2";
	}

	//F3
	if argument0 = (vk_f3)
	{
	    return "F3";
	}

	//F4
	if argument0 = (vk_f4)
	{
	    return "F4";
	}

	//F5
	if argument0 = (vk_f5)
	{
	    return "F5";
	}

	//F6
	if argument0 = (vk_f6)
	{
	    return "F6";
	}

	//F7
	if argument0 = (vk_f7)
	{
	    return "F7";
	}

	//F8
	if argument0 = (vk_f8)
	{
	    return "F8";
	}

	//F9
	if argument0 = (vk_f9)
	{
	    return "F9";
	}

	//F10
	if argument0 = (vk_f10)
	{
	    return "F10";
	}

	//F11
	if argument0 = (vk_f11)
	{
	    return "F11";
	}

	//F12
	if argument0 = (vk_f12)
	{
	    return "F12";
	}

	//Numpad 0
	if argument0 = (vk_numpad0)
	{
	    return "0";
	}

	//Numpad 1
	if argument0 = (vk_numpad1)
	{
	    return "1";
	}

	//Numpad 2
	if argument0 = (vk_numpad2)
	{
	    return "2";
	}

	//Numpad 3
	if argument0 = (vk_numpad3)
	{
	    return "3";
	}

	//Numpad 4
	if argument0 = (vk_numpad4)
	{
	    return "4";
	}

	//Numpad 5
	if argument0 = (vk_numpad5)
	{
	    return "5";
	}

	//Numpad 6
	if argument0 = (vk_numpad6)
	{
	    return "6";
	}

	//Numpad 7
	if argument0 = (vk_numpad7)
	{
	    return "7";
	}

	//Numpad 8
	if argument0 = (vk_numpad8)
	{
	    return "8";
	}

	//Numpad 9
	if argument0 = (vk_numpad9)
	{
	    return "9";
	}

	//Multiply
	if argument0 = (vk_multiply)
	{
	    return "*";
	}

	//Divide
	if argument0 = (vk_divide)
	{
	    return "/";
	}

	//Add
	if argument0 = (vk_add)
	{
	    return "+";
	}

	//Subtract
	if argument0 = (vk_subtract)
	{
	    return "-";
	}

	//Decimal
	if argument0 = (vk_decimal)
	{
	    return ".";
	}

	// Printable characters.
	return chr(argument0);
}