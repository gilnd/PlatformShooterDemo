with(weapon) {
	should_shoot = true
}

if not can_shoot_player(self, oEnemy) {
	behaviour_switch(bhFollowPlayer, false)
}