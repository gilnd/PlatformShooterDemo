///get_bbox_x(obj, from)

var obj, bottom = false,
obj = argument_count == 0 ? self : argument[0]

if argument_count > 1 {
	bottom = obj.y -argument[1].y < 0
} else {
	if(obj.vsp != undefined) {
		bottom = obj.vsp >= 0 
	}
}

return bottom ? obj.bbox_bottom: obj.bbox_top