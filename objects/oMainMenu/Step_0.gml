/// @description MENU Controll
scrGetNavigationInput();

if not instance_exists(subMenu) { 
	// Main menu controls
	if lockdown > 0 then lockdown--;
	
	move = key_right -key_left; 

	if (move != 0 and lockdown == 0 ){
	
		var j = (mpos + move ) mod arrayLength
		mpos = j < 0 ? arrayLength + j : j  
	
		lockdown = round(max(2, room_speed / (3 + lockdownDivider)));
		lockdownMax = move * lockdown;
		lockdownDivider = min(lockdownDivider, 5);
		audio_play_sound(sndClick,1,false);
	}

	var push;
	push = key_confirm; //max(max(keyboard_check_released(vk_enter), gamepad_button_check_released(0, gp_face1), 0));
	if (push == 1){
		audio_play_sound(sndSelect,1,false);
		if(saveFile){
			switch(mpos) {
				case 0:{ 
						loadGame();
						scrSlideTransition(TRANS_MODE.GOTO, checkpointRoom);
					} break;
			    case 1:{ 
					scrSlideTransition(TRANS_MODE.NEXT); 
					removeSavedStuff();
					} break;
			    case 2:{ scrSlideTransition(TRANS_MODE.GOTO, rm_enemy_test); } break;
			    case 3:{ subMenu = instance_create_layer(x,y, depth, oOptions) } break;
			    case 4:{ game_end(); } break;
			    default: break;
			}
		} else {
			switch(mpos) {
			    case 0:{ scrSlideTransition(TRANS_MODE.NEXT); } break;
			    case 1:{ scrSlideTransition(TRANS_MODE.GOTO, rm_enemy_test); } break;
			    case 2:{ subMenu = instance_create_layer(x,y, depth, oOptions) } break;
			    case 3:{ game_end(); } break;
			    default: break;
			}
		}
	}
}