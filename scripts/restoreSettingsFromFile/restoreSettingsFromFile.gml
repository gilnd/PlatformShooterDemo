/// @description Load Settings

ini_open("settings.ini");

// 1: true 0: false
global.settings = ds_map_create();

#region ### Graphic Settings ###

global.settings[? "fullscreen"] = ini_read_real("GraphicSettings", "fullscreen", 0)
global.settings[? "resolutionScale"] = ini_read_string("GraphicSettings", "resolutionScale", "1366x768")
global.settings[? "zoom"] = ini_read_real("GraphicSettings", "zoom", 4)
#endregion

#region ### Audio Settings ###

global.settings[? "audio"] = ini_read_real("AudioSettings", "audio", 0)
global.settings[? "musicVolume"] = ini_read_real("AudioSettings", "musicVolume", 10)	// 0: min / 10: max
global.settings[? "sfxVolume"] = ini_read_real("AudioSettings", "sfxVolume", 10)		// 0: min / 10: max

#endregion

ini_close();

/*global.Settings[0] = global.settings[? "fullscreen"];
global.Settings[1] = global.settings[? "resolutionScale"];
global.Settings[2] = global.settings[? "zoom"];
global.Settings[3] = global.settings[? "audio"];
global.Settings[4] = global.settings[? "musicVolume"];
global.Settings[5] = global.settings[? "sfxVolume"];*/
