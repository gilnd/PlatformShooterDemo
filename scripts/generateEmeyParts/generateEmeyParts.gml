// generateEmeyParts(part)
repeat(irandom_range(0, 2)){
	with(instance_create_layer(x, y, layer, argument0)){
		direction = other.hitfrom
		hsp = lengthdir_x(3, direction)
		vsp = lengthdir_y(3, direction)-2
		if(sign(hsp) != 0) image_xscale = sign(hsp)
		sprite_index = sEnemy_BlueBatPart;
		image_speed = 0;
		//image_index = irandom_range(0, sprite_get_number(sEnemy_BlueBatPart));
		image_index = irandom_range(0, image_number);
	}
}