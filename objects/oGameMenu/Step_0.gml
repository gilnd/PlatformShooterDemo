/// @description Insert description here
// You can write your code in this editor

// Toggle Pause Mode
if(keyboard_check_pressed(vk_escape)) { 
	if global.GAME_PAUSE  {
		disablePauseMode();
	} else {
		enablePauseMode()
	}
}


if(global.GAME_PAUSE){
	scrGetNavigationInput();
	var push;
	push = key_confirm; 
	if (push == 1){
		audio_play_sound(sndSelect,1,false);
		switch(mpos) {
		    case 0:{ scrSlideTransition(TRANS_MODE.RESTART_GAME); } break;
		    case 1:{ 
				saveGame(room, oPlayer.x, oPlayer.y);
				scrSlideTransition(TRANS_MODE.GOTO, room); } break;
		    case 2:{ 
				saveGame(room, oPlayer.x, oPlayer.y);
				game_end()
			} break;
		    case 3:{ 
				saveGame(room, oPlayer.x, oPlayer.y); 
				scrToastMessage("Game saved succesfully!");
				} break;
			case 4:{ } break;
		    default: break;
		}
		disablePauseMode()
	}
}