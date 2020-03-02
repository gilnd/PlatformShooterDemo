//can_shoot_player(obj, whatCantBeInTheMidle...)
var obj = argument[0]
var tx = get_bbox_x(oPlayer)
var ty = get_center_y(oPlayer)

tx += sign(get_bbox_x()) * 5
ty -= 5

if collision_line(obj.x, obj.y, tx, ty, oBlock, false, true) {
		return false
}
for (var i=1; i<argument_count; i++) {
	if collision_line(obj.x, obj.y, tx, ty, argument[1], false, true) {
		return false
	}
}
return true