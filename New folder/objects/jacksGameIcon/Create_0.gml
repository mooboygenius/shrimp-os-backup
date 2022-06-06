if live_call() return live_result;

event_inherited();

with createShrimpy("InstantShrimp Worm Scan has indicated that \"JAC'KS GAME\" may be harmful to your system!\n\nIt is advised that you do NOT open this program!") {
	destroyScript=function() {
		/// @function destroyScript()
		timer++;
		if timer>600 {
			state=1;
		}
	}
}