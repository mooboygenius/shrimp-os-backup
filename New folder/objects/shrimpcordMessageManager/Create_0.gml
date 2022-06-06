if live_call() return live_result;

event_inherited();

drawScript=function() {}

messages=ds_list_create();
messageObjects=ds_list_create();
messenger=shrimpcordAutomessenger;

startY=106;
startX=116;

messageBox=instance_create_depth(-999, 0, depth-1, shrimpcordMessageBox);

with parentWindow {
	ds_list_add(children, other.messageBox);
}
portWidth=100;
portHeight=100;

createMessage=function(n, t, pp=sprShrimpcordDefaultIcon, h=current_hour, m=current_minute, addToProfileList=true, obj=shrimpcordMessage) {
	/// @function createMessage(name, text, [profileImage], [hour], [minute], [addToProfileList], [object])
	var inst=instance_create_depth(startX, startY, depth-1, obj);
	with inst {
		visible=false;
		name=n;
		text=t;
		profileImage=pp;
		hour=h;
		minute=m;
		xstart=other.startX;
		ystart=other.startY-4;
	}
	with parentWindow {
		ds_list_add(children, inst);
	}
	ds_list_add(messageObjects, inst);
	ds_list_add(messages, [n, t, pp, h, m]);
	if addToProfileList {
		if instance_exists(owner) {
			show_debug_message(concat("updating owner list with new message: \"", t, "\""));
			ds_list_add(owner.messages, [n, t, pp, h, m]);
		}
	}
	return inst;
}