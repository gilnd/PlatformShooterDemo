with(instance_create_layer(get_bbox_x(oPlayer) + 6, get_center_y(oPlayer), "Main", oTakeWeapon)) {
	weapon_id = argument0
	weapon = ds_map_clone(global.weapon_array[weapon_id]);
}