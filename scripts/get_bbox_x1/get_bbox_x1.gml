///get_bbox_x(obj, from)

var obj, right,
obj = argument_count == 0 ? self : argument[0]
if argument_count > 1 {
	right = sign(argument[1].x - obj.x) == 1
} else {
	right = image_xscale == (obj.sprite_reversed ? -1 : 1)
}

return right ? obj.bbox_right : obj.bbox_left