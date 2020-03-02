// saveInventory()
ini_open("inventory.ini")

//Inventory
if instance_exists(oPlayer) { 
	ini_section_delete("Inventory")
	
	var len = ds_list_size(oPlayer.inventory)
	ini_write_real("Inventory", "length", len)
	
	for (var i = 0; i < len; i++) {
		var item = oPlayer.inventory[|i];
		ini_write_string("Inventory", format("item[{}]", i), ds_map_write(item));
		ini_write_string("Inventory", format("item[{}].data", i), ds_map_write(item[?"data"]));
	}
}

// Other
ini_close()
