// @description Get The sCanInteract Index Sprite Checking the Input Type Device.
// Keyboard / Default
char = "e";
// Controller
if (global.InputType == "GamePad" && gamepad_is_connected(global.GamePadIndex) ){ 
	if (gamepad_get_description(global.GamePadIndex) == "Xbox 360 Controller (XInput STANDARD GAMEPAD)") { 
		char = "x"; // Xbox360
	} else if (global.InputType == "Gamepad" && gamepad_get_description(global.GamePadIndex) == "PLAYSTATION(R)3 Controller") { 
		char = "v"; // PS3
	}
}
return char;