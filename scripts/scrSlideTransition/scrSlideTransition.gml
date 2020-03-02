// @desc	:	scrSlideTransition(mode, targetroom)
// @param	:	mode Sets trainsition mode betweeen NEXT, RESTART and GOTO.
// @param*	:	target sets target room.				(ONLY when using GOTO mode)
// @param*	:	targetX X coordinate of the player.		(ONLY when using GOTO mode)
// @param*	:	targetX X coordinate of the player.		(ONLY when using GOTO mode)
//	*		:	facoltative param

with(oTransition) {
	mode = argument[0];
	if (argument_count > 1) { target = argument[1]; }
	if argument_count > 2 && argument[2] {
		movePlayer = argument[2];
		targetX = argument[3];
		targetY = argument[4];
	} else { movePlayer = false; }
}
