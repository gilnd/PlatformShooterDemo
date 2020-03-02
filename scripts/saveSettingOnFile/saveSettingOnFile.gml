/// @description Save Settings

ini_open("settings.ini");

// 1: true 0: false

#region ### Graphic Settings ###

ini_write_real("GraphicSettings", "fullscreen",  global.settings[? "fullscreen"]);
ini_write_string("GraphicSettings", "resolutionScale", string(global.settings[? "resolutionScale"]));
ini_write_real("GraphicSettings", "zoom", global.settings[? "zoom"]);

#endregion

#region ### Audio Settings ###

ini_write_real("AudioSettings", "audio", global.settings[? "audio"]);
ini_write_real("AudioSettings", "musicVolume", global.settings[? "musicVolume"]);	// 0: min / 10: max
ini_write_real("AudioSettings", "sfxVolume", global.settings[? "sfxVolume"]);		// 0: min / 10: max

#endregion

ini_close();