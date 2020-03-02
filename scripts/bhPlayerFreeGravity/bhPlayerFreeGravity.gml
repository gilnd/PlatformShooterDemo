scrGetPlayerMoveInput()

if keyboard_check(vk_up) || keyboard_check(ord("W")) {
	y -= movespeed
}

if key_down {
	y += movespeed
}

if key_left {
	x -= movespeed
}

if key_right {
	x += movespeed
}