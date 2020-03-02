/// stay on the platform

diff = x - oPlayer.x

if between(-2, diff, 2) {
	state_switch("Idle")
} else {
	image_xscale = sign(diff)
	state_switch("Walk")
}

if !place_meeting(get_bbox_x() + hsp, bbox_bottom, oBlock) {
	state_switch("Idle")
}
