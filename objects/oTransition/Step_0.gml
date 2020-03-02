/// @description Progress the transition
//log("trans", mode, percent)
if mode != TRANS_MODE.OFF {
	if mode == TRANS_MODE.ON {
		percent = max(0, percent - max((percent/10), 0.005)); //the transition is more slow on the last pixel
	} else {
		percent = min(1, percent + max(((1- percent)/10), 0.005));
	}
	
	if(percent == 1 or percent == 0){
		switch (mode){
			case TRANS_MODE.ON: { mode = TRANS_MODE.OFF; } break;
			case TRANS_MODE.GOTO: {
				mode = TRANS_MODE.ON
				if(movePlayer){
					oPlayer.x = targetX;
					oPlayer.y = targetY;
				}
				room_goto(target);
			} break;
			
			case TRANS_MODE.RESTART_GAME: {
				mode = TRANS_MODE.ON;
				game_restart()
			} break;
			
			case TRANS_MODE.RESTART_ROOM: {
				mode = TRANS_MODE.ON;
				room_restart()
			} break;
			
			case TRANS_MODE.NEXT: {
				mode = TRANS_MODE.ON;
				if(movePlayer){
					oPlayer.x = targetX;
					oPlayer.y = targetY;
					movePlayer = false;
				}
				room_goto_next();
			} break;
			
			default:{
				mode = TRANS_MODE.ON;
			} break;
		}
	}
}
