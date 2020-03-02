// loadGame()


ini_open("inventory.ini")

	
if instance_exists(oPlayer) {
	var len = ini_read_real("Inventory", "length", 0)
	var list = ds_list_create()
		
	for (var i = 0; i < len; i++) {
		var itemMap = ds_map_create()
			
		var map64 = ini_read_string("Inventory", format("item[{}]", i), "")
		ds_map_read(itemMap, map64)
			
		var data_map = ds_map_create()
		ds_map_read(data_map, ini_read_string("Inventory", format("item[{}].data", i), ""))
		itemMap[?"data"] = data_map
		ds_list_add(list, itemMap)
			
	}
		
	oPlayer.inventory = list
}
	
ini_close();