/// addItemToInventory(obj)

var o = argument0 

if o.scriptGet != noone { script_execute(o.scriptGet, o.data) }

var map = ds_map_create()
map[? "data"] = o.data
map[? "sprite"] = sprite_get_name(o.sprite)
map[? "scriptUse"] = o.scriptUse
map[? "scriptConsult"] = o.scriptConsult

ds_list_add(oPlayer.inventory, map)
saveInventory()