/// @description Create Leaf
repeat(2)+1{
	instance_create_layer(x+irandom_range(-4, +4), y, "Instances_Objects", oLeaf);
}

alarm[0] = irandom_range(240, 960);