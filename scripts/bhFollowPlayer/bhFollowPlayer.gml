/// stay on the platform

#region physics

var bbox_x = get_bbox_x()

var on_ground = place_meeting(x, bbox_bottom, oBlock)
var wall_near = place_meeting(bbox_x, y, oBlock)
var can_go_ahead = place_meeting(bbox_x, bbox_bottom, oBlock) 

var scalable_wall_near = place_meeting(bbox_x, y, oBlockScalable)
var scalable_wall_below = place_meeting(x, bbox_bottom, oBlockScalable)
#endregion
//var range = 300
var range_x = range
var range_y = range/2
#region PlayerStuff

diffx = x - oPlayer.x
diffy = y - oPlayer.y

var closer_in_x = between(-20, diffx, 20)
var closer_in_y = between(-range_y, diffy, range_y)

#endregion


if going > 1  {
	
	var delta = sprite_height * (2/3)
	var dir = sign(image_xscale)
	
	if collision_rectangle(x, y, x+(delta*dir), y+delta, oBlockScalable, false, true) == noone {
		going = 0
		vsp = 0
		state_switch("Walk", false)
	}
} else {


	if closer_in_x and closer_in_y {
		image_xscale = reverse(sign(diffx))
		state_switch("Idle", false)
		//behaviour_switch(bhShootPlayer, true)
		going = 0
	} else {

		if on_ground  {
	
			if wall_near {
		
				if scalable_wall_near {
					state_switch("Jump", false)
					going = 2
				} else {
					//state_switch("Idle", false)
					image_xscale = reverse(image_xscale)
					should_jump = false
					going = -1
					//behaviour_switch(bhShootPlayer, true)
				}
	
			} else {
		
				if not can_go_ahead and not scalable_wall_below  {
					image_xscale = reverse(image_xscale)
					should_jump = false
					going = -1
				} else {
					/*if going >=0 {
						if closer_in_y {
							image_xscale = sign(diffx)
						}
						state_switch("Walk", false)
						going = 1
					}*/
					going = 1
				}
				state_switch("Walk", false)
				
			}
	
		} 
	}
}



