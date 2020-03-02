///ds_map_clone(map)

var map, clone;
var map = argument0;
var clone = ds_map_create();
ds_map_copy(clone, map);
return clone;
