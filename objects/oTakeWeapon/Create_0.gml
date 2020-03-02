/// @description Init
event_inherited()

if weapon_id == -1 {
	weapon_id = irandom_range(1,array_length_1d(global.weapon_array)-1)
}

weapon = ds_map_clone(global.weapon_array[weapon_id]);
sprite_index = weapon[? "sprite_take"]

// Cosmetic Stuff
//Rotation
minAngle = irandom_range(-15, -5);
maxAngle = irandom_range(5, 15);

onCycle = false;
dirCycle = choose("Left", "Right");

image_angle=0;

outline_init();

colorSaturation = 50;
colorSaturationIncrease = true;
myDialog = noone