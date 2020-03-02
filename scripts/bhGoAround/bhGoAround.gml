/// stay on the platform


var bbox_x = get_bbox_x()

var on_ground = place_meeting(x, bbox_bottom, oBlock)
var wall_near = place_meeting(bbox_x, y, oBlock)
var can_go_ahead = place_meeting(bbox_x, bbox_bottom, oBlock)

var scalable_wall_near = place_meeting(bbox_x, y, oBlockScalable)
var scalable_wall_below = place_meeting(x, bbox_bottom, oBlockScalable)


if going > 1 {
	
	var delta = sprite_height * (2/3)
	var dir = sign(image_xscale)
	
	if collision_rectangle(x, y, x+(delta*dir), y+delta, oBlockScalable, false, true) == noone {
		going = 0
		vsp = 0
		state_switch("Walk", false)
	}
} 
if on_ground  {

	if wall_near {
		
		if(scalable_wall_near) {
			state_switch("Jump", false)
			going = 2
		} else {
			image_xscale = reverse(image_xscale)
			should_jump = false
			going = -1
		}
	
	} else {
		
		if not can_go_ahead and not scalable_wall_below  {
			image_xscale = reverse(image_xscale)
			should_jump = false
			going = -1
		} else {
			going = 1
		}
		
		state_switch("Walk", false)
	}
	
} 







