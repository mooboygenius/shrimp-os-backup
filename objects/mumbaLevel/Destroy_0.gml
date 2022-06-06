if live_call() return live_result;
if ds_exists(children, ds_type_list) {
	for (var i=0; i<ds_list_size(children); i++) {
		with children[| i] {
			instance_destroy();
		}
	}
	ds_list_destroy(children);
}

if ds_exists(levelInstances, ds_type_list) {
	for (var i=0; i<ds_list_size(levelInstances); i++) {
		with levelInstances[| i] {
			instance_destroy();
		}
	}
	ds_list_destroy(levelInstances);
}

if surface_exists(tileSurface) surface_free(tileSurface);

if won {
	updateData(concat(winLevelName, "State"), mumbaLevelState.complete);
	for (var i=0; i<array_length(unlockLevels); i++) {
		var n=concat(unlockLevels[i], "State");
		updateData(n, max(mumbaLevelState.unlocked, loadData(n, mumbaLevelState.unlocked)));
	}
	saveGame();
}

sprite_delete(sprite);