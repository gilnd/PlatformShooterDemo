///generateDeadEnemy(deadEnemy)
with(instance_create_layer(x, y, layer, argument0)){
		direction = other.hitfrom
		hsp = lengthdir_x(3, direction)
		vsp = lengthdir_y(3, direction)-2
		if(sign(hsp) != 0) image_xscale = sign(hsp)
	}