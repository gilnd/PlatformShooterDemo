/// @description Insert description here
// You can write your code in this editor
move = 0
move -= max(key_up); //max(keyboard_check_pressed(vk_up), gamepad_button_check_pressed(0, gp_padu), gamepad_axis_value(0, gp_axislv) < 0, 0);
move += max(key_down); //max(keyboard_check_pressed(vk_down), gamepad_button_check_pressed(0, gp_padd), gamepad_axis_value(0, gp_axislv) > 0, 0);
moveValue = key_right -key_left; 

if (move != 0){		
	subMpos += move;
	if (subMpos < 0) subMpos = array_length_1d(settingsMenu) - 1;
	if (subMpos > array_length_1d(settingsMenu) -1) subMpos = 0;
	audio_play_sound(sndClick,1,false);
}

if (key_confirm){
	audio_play_sound(sndSelect,1,false);
	switch(subMpos) {
		case 0: case 1: case 2: case 3: case 4: { } break;
		case 6:{ 
			saveSettingOnFile(); 
			instance_destroy()
			} break;
		case 7:{ 
			restoreSettingsFromFile();
			instance_destroy()
			} break;
		default: break;
	}
} else if (moveValue != 0) {
	switch(subMpos) {
		case 0:{
			if((global.settings[? "fullscreen"] == 1)){
				global.settings[? "fullscreen"] = 0;
				settingsValues[0] = "false";
				//settingsValues[1] = "1366x768";
				//global.settings[? "resolutionScale"] = "1366x768";
			} else {
				global.settings[? "fullscreen"] = 1;
				settingsValues[0] = "true";
				//settingsValues[1] = "Auto";
				//global.settings[? "resolutionScale"] = "Auto";
			} window_set_fullscreen(global.settings[? "fullscreen"]);
			} break;
		case 1: { 
				var index = 0;
				for (var i = 0; i < array_length_1d(resolutionScale); i++){
					if (resolutionScale[i]==global.settings[? "resolutionScale"]){
						index = i;
						break;
					}
				}
				
				if(index + moveValue >=0 and index + moveValue < array_length_1d(resolutionScale)) {
					settingsValues[1] = resolutionScale[index + moveValue];
					global.settings[? "resolutionScale"] = resolutionScale[index + moveValue];	
					// todo dont allow low resolution without low zoom or..maybe remove 
					// the (480x320) res im using it just to run the game at work just
					// cuz trying to don't be discovered by the evil boss <3 
				}
			} break;
		case 2:{ 
			if(global.settings[? "zoom"] + moveValue >= 2 and global.settings[? "zoom"] + moveValue <= 6) {
				global.settings[? "zoom"] += moveValue;
				settingsValues[2] = global.settings[? "zoom"];
				camera_set_view_size(oMainMenu.cam, 
					view_wport[oMainMenu.target_view]/global.settings[? "zoom"], 
					view_hport[oMainMenu.target_view]/global.settings[? "zoom"]);
					
			} } break;
		case 3:{ 
			if((global.settings[? "audio"] == 1)){
				global.settings[? "audio"] = 0;
				settingsValues[0] = "false";
			} else {
				global.settings[? "audio"] = 1;
				settingsValues[3] = "true";
			} } break;
		case 4: {
			if(global.settings[? "musicVolume"] + moveValue >= 0 and global.settings[? "musicVolume"] + moveValue <= 10) {
				global.settings[? "musicVolume"] += moveValue;
				settingsValues[4] = global.settings[? "musicVolume"];
			} } break;
		case 5: {
			if(global.settings[? "sfxVolume"] + moveValue >= 0 and global.settings[? "sfxVolume"] + moveValue <= 10) {
				global.settings[? "sfxVolume"] += moveValue;
				settingsValues[5] = global.settings[? "sfxVolume"];
			} } break;
	}
}