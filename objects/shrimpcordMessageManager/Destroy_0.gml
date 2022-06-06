if live_call() return live_result;
instance_destroy(messageBox);
for (var i=0; i<ds_list_size(messages); i++) {
	if instance_exists(messageObjects[| i]) instance_destroy(messageObjects[| i]);
}
ds_list_destroy(messageObjects);
ds_list_destroy(messages);