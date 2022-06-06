function unlockMedal(name) {
	if os_browser==browser_not_a_browser {
		show_debug_message(concat("(WOULD'VE) UNLOCKED: ", name));
	} else {
		ng_unlockmedal(name);
		show_debug_message(concat("UNLOCKED: ", name));
	}
}