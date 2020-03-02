/// @description Test Here Shit you want to test
debugKPressed = !debugKPressed;

/*if(debugKPressed){
	myDialog = scrMessageBox("Debug!", string(layer_get_name(layer_get_element_layer(oTransition))), 2, oPlayer.x, y-oPlayer.sprite_height, true);
} else {
	instance_destroy(myDialog);
	myDialog = noone;
}*/

var curItem = 0

if not ds_list_empty(inventory) {
	var i = inventory[| curItem]
	
	if i[?"scriptUse"] != noone {
		var ok = script_execute(asset_get_index(i[?"scriptUse"]), i[?"data"])
		if ok {
			removeItemFromInventory(curItem)
		} else {
			scrToastMessage("unable to use key")
		}
	}
} else {
	scrToastMessage("no items in inventory")
}
