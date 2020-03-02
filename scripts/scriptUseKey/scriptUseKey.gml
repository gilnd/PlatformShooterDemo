//if(debugKPressed){
var data = argument0
var chest = instance_place(get_bbox_x()+1,y, oWoodChest)

if chest != noone {
	if chest.secret == data[?"secret"] {
	
		script_execute(chest.scriptChestOpened)
		usedKey(data[?"secret"])
		instance_destroy(chest)
		return true
	} else {
		scrToastMessage("wrong key")
	}
}

return false