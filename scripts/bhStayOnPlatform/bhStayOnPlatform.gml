/// stay on the platform
if !place_meeting(get_bbox_x() + hsp, bbox_bottom, oBlock) {
	image_xscale = reverse(image_xscale)
}


if state_timer > 100 {
if chance(0.3) 
	state_switch("Idle")
else
	state_switch("Walk")
}
