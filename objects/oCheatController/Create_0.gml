/// @description Insert description here
// You can write your code in this editor

cheat_list = ds_list_create()

ammo = ds_map_create()
ammo[? "text"] = "outofammo"
ammo[? "script"] = cheat_ammo
ds_list_add(cheat_list, ammo)


weapon = ds_map_create()
weapon[? "text"] = "killthemall"
weapon[? "script"] = cheat_weapon
weapon[? "arg0"] = 4
ds_list_add(cheat_list, weapon)

max_str = 0
str = ""

for(var i=0; i<ds_list_size(cheat_list); i++) {
	var cheat = ds_list_find_value(cheat_list, i)
	max_str = max(max_str, string_length(cheat[?"text"]))
}
max_str = max_str * 2


