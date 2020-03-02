///@description Particle Init
primaryColor = c_red;		//Default
accentColor = c_orange;		//Default
rangeEffect = 8;			//Default
dir = 90;


//Particle System
partSys = part_system_create();
part_system_layer(partSys, "Instances_Objects");


//Particle
part = part_type_create();
part_type_shape(part, pt_shape_square);
//part_type_sprite(part, sHeart, 0, 0, 0)
part_type_scale(part, 0.2, 0.2);
part_type_size(part, 0.10,0.15,-.001,0);
//part_type_color2(part, primaryColor, accentColor);
//part_type_alpha2(part, 1, 0.5);
part_type_color2(part,oWeapon.currentWeapon[? "primary_color"],oWeapon.currentWeapon[? "accent_color"]);
part_type_alpha2(part,1,0.75);

//part_type_speed(part, 0.1, 0.5, 0, 0);
part_type_speed(part,0.1,0.5,0,0);

part_type_direction(part, dir-45, dir+45, 0, 0);
//part_type_gravity(part, 0.05, dir);
part_type_gravity(part,0.02,90);

part_type_orientation(part,0,359,10,0,true);

//part_type_life(part, room_speed/2, room_speed);
part_type_life(part,100,150);

part_type_blend(part, true);


//Particle Emitter
partEmit = part_emitter_create(partSys);
//part_emitter_region(partSys, partEmit, x - rangeEffect, x + rangeEffect, 
//	y - rangeEffect, y + rangeEffect, ps_shape_rectangle, ps_distr_gaussian);
part_emitter_region(partSys, partEmit, x-4, x+4, y-4, y+4, ps_shape_ellipse, ps_distr_gaussian);
part_emitter_stream(partSys, partEmit, part, 1);

