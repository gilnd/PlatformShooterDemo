/// @description: generates some random fx giving some parameters
// argument0: direction
// argument1: speed
// argument2: dir
// argument3: color1
// argument4: color2
// argument5: decrease


if(chance(0.5)){
	spark = instance_create_depth(x,y-1,depth+1, oSfxSpark);
	spark.direction = argument0;
	spark.speed = argument1;
	spark.dir = argument2;
	spark.colour1 = argument3;
	spark.colour2 = argument4;
	spark.decrease = argument5;
} else {
	circle = instance_create_depth(x,y-1,depth+1, oSfxCircle);
	circle.direction = argument0;
	circle.speed = argument1;
	circle.dir = argument2;
	circle.colour1 = argument3;
	circle.colour2 = argument4;
	circle.decrease = argument5;
}
