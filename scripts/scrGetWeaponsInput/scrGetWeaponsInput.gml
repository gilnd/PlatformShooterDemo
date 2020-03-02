 /// @description get the input for player and o weapon

//Arrows or WASD or GamePad
if (gp_any() > 0) { global.InputType = "GamePad";}
else if (keyboard_check(vk_anykey) || mouse_check_button(mb_any)){ global.InputType = "Keyboard";}

if(global.InputType == "Keyboard") {
	//oWeapon
	switch(currentWeapon[? "type"]){
		case "NA": key_shot = mouse_check_button_pressed(mb_left); break;
		case "A": key_shot = mouse_check_button(mb_left); break;
		case "C": key_shot = mouse_check_button_released(mb_left);break;
	}
	key_shot_pressed = mouse_check_button(mb_left);
	key_reload_weapon = (keyboard_check_pressed(ord("R")));
	key_change_weapon = (keyboard_check_pressed(ord("C")));
	
} else if (global.InputType == "GamePad" && gamepad_is_connected(global.GamePadIndex) ){
	//oWeapon
	switch(currentWeapon[? "type"]){
		case "NA": key_shot = gamepad_button_check_pressed(global.GamePadIndex, gp_shoulderrb); break;
		case "A": key_shot = gamepad_button_check(global.GamePadIndex, gp_shoulderrb); break;
		case "C": key_shot = gamepad_button_check_released(global.GamePadIndex, gp_shoulderrb);break;
	}
	key_shot_pressed = gamepad_button_check(global.GamePadIndex, gp_shoulderrb);
	key_reload_weapon = gamepad_button_check_pressed(global.GamePadIndex, gp_face3);
	key_change_weapon = gamepad_button_check_pressed(global.GamePadIndex, gp_shoulderr);
}
