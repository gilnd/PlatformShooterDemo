 /// @description Navigation to menu and stuff input script

//Arrows or WASD or GamePad
if (gp_any() > 0) { global.InputType = "GamePad";}
else if (keyboard_check(vk_anykey) || mouse_check_button(mb_any)){ global.InputType = "Keyboard";}

if(global.InputType == "Keyboard") {
	
	// Move
	key_right = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));
	key_left = keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"));
	key_up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
	key_down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
	
	// Confirm / Cancel
	key_confirm = keyboard_check_pressed(vk_enter);
	key_cancel = keyboard_check_pressed(vk_escape);
	
} else if (global.InputType == "GamePad" && gamepad_is_connected(global.GamePadIndex) ){
	
	// Move
	key_right = gamepad_axis_value(global.GamePadIndex, gp_axislh) > 0;
	key_left = gamepad_axis_value(global.GamePadIndex, gp_axislh) < 0;
	key_up = gamepad_button_check_pressed(global.GamePadIndex, gp_face1);
	key_down = gamepad_axis_value(global.GamePadIndex, gp_axislv) > 0;
	
	// Confirm / Cancel
	key_confirm = gamepad_button_check_pressed(global.GamePadIndex, gp_face1);//A
	key_cancel = gamepad_button_check_pressed(global.GamePadIndex, gp_face2);//B
	
}

