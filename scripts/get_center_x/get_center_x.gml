///get_center_y(obj)

var obj = argument_count == 0 ? self : argument[0]
var half = obj.sprite_width/2

var rev = 1
//variable_instance_exists(
if variable_instance_exists(obj, "sprite_reversed") {
	rev = image_xscale == (obj.sprite_reversed ? -1 : 1) ? 1: -1
}
return obj.bbox_left + half*rev
