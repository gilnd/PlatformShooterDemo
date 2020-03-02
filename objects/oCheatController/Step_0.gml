/// @description Insert description here
// You can write your code in this editor



if keyboard_lastkey != -1 {
   str += keyboard_lastchar;
   keyboard_lastkey = -1;
}

for(var i=0; i<ds_list_size(cheat_list); i++) {
	
	var cheat = ds_list_find_value(cheat_list, i)
	if string_pos(cheat[?"text"], str) != 0 {
		script_execute(cheat[? "script"], ds_map_get(cheat, "arg0", noone))
		str=""
		break
	}
}

if string_length(str) >= max_str {
	str = ""
}