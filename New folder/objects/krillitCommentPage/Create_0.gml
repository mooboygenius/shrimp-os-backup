if live_call() return live_result;

// Inherit the parent event
event_inherited();

fullPost=instance_create_depth(-1000, -1000, depth-10, krillitFullPost);
postName="placeholder post name";
votes=string(irandom(999));
image=noone;
text="description text goes here lolololol i love pussy";
with fullPost {
	postName=other.postName;
	votes=other.votes;
	image=other.image;
	text=other.text;
}
ds_list_add(children, fullPost);
replies=ds_list_create();