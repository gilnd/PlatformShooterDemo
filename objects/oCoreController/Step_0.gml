 /// @description General Controls

// Fullscreen
if keyboard_check_pressed(vk_f11) {
	global.settings[? "fullscreen"] = (global.settings[? "fullscreen"] == 1) ? 0 : 1;
	saveSettingOnFile();
	window_set_fullscreen(global.settings[? "fullscreen"]);
}


// Game --> Room Switch
/*if (keyboard_check_pressed(ord("N")) && room_next(room) != -1) {
	saveState()
	scrSlideTransition(TRANS_MODE.NEXT);
	//room_goto_next();
}

if (keyboard_check_pressed(ord("P")) && room_previous(room) != -1) {
	saveState()
	scrSlideTransition(TRANS_MODE.GOTO, room_previous(room));
	//room_goto_previous();
}*/


