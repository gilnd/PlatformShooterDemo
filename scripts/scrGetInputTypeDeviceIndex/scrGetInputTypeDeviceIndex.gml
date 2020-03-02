// @description Get The sCanInteract Index Sprite Checking the Input Type Device.
index = 0;
// Keyboard / Default
if(global.InputType == "Keyboard") { 
	index = 0;
}
// Controller
else if (global.InputType == "GamePad" && gamepad_is_connected(global.GamePadIndex) ){ 
	if (gamepad_get_description(global.GamePadIndex) == "Xbox 360 Controller (XInput STANDARD GAMEPAD)") { 
		index = 1; // Xbox360
	} else if (global.InputType == "Gamepad" && gamepad_get_description(global.GamePadIndex) == "PLAYSTATION(R)3 Controller") { 
		index = 2; // PS3
	}
}
return index;