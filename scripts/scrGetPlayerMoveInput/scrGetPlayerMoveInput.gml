 /// @description get the input for player and o weapon

//Arrows or WASD or GamePad
if (gp_any() > 0) { global.InputType = "GamePad";}
else if (keyboard_check(vk_anykey) || mouse_check_button(mb_any)){ global.InputType = "Keyboard";}

if(global.InputType == "Keyboard") {
	//oPlayer
	key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	key_up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
	key_up_release = keyboard_check_released(vk_up) || keyboard_check_released(ord("W"));
	key_down = keyboard_check(vk_down) || keyboard_check(ord("S"));
	key_space = keyboard_check(vk_space);
	
} else if (global.InputType == "GamePad" && gamepad_is_connected(global.GamePadIndex) ){
	//oPlayer
	key_right = gamepad_axis_value(global.GamePadIndex, gp_axislh) > 0;
	key_left = gamepad_axis_value(global.GamePadIndex, gp_axislh) < 0;
	key_up = gamepad_button_check_pressed(global.GamePadIndex, gp_face1);
	key_up_release = gamepad_button_check_released(global.GamePadIndex, gp_face1);
	key_down = gamepad_axis_value(global.GamePadIndex, gp_axislv) > 0;
	key_space = gamepad_button_check_pressed(global.GamePadIndex, gp_face2);
}


