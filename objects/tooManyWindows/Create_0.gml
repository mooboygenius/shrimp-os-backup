if live_call() return live_result;

event_inherited();
setWindowSize(self, 0, 0, 140, 80);
centerWindow(self);

okButton=instance_create_depth(0, 0, depth-10, textButton)
with okButton {
	parent=other;
	text="Fine I guess";
	clickFunction=function() {
		parent.state=windowStates.close;
	}
}
ds_list_add(children, okButton);