 /// @description get the event input for player

//Arrows or WASD or GamePad
if (gp_any() > 0) { global.InputType = "GamePad";}
else if (keyboard_check(vk_anykey) || mouse_check_button(mb_any)){ global.InputType = "Keyboard";}

if(global.InputType == "Keyboard") {
	//oPlayer
	key_interact = (keyboard_check_pressed(ord("E")));
	
} else if (global.InputType == "GamePad" && gamepad_is_connected(global.GamePadIndex) ){
	//oPlayer
	key_interact = gamepad_button_check_pressed(global.GamePadIndex, gp_face4);
}

