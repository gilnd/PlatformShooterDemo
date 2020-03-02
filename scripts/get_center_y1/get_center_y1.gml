///get_center_y(obj)

var obj = argument_count == 0 ? self : argument[0]
var half = obj.sprite_height/2
return obj.bbox_top + half
