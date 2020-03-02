/// @description Insert description here
// You can write your code in this editor
subMpos = 0;
anim = 0;
anim_n =0;


settingsMenu[0] = "FULLSCREEN"
settingsMenu[1] = "RESOLUTION SCALE"
settingsMenu[2] = "ZOOM"
settingsMenu[3] = "AUDIO"
settingsMenu[4] = "MUSIC VOLUME"
settingsMenu[5]= "SFX VOLUME"
settingsMenu[6] = "SAVE"
settingsMenu[7] = "CANCEL"

settingsValues[0] = global.settings[? "fullscreen"] ? "true" : "false";
settingsValues[1] = global.settings[? "resolutionScale"];
settingsValues[2] = global.settings[? "zoom"];
settingsValues[3] = global.settings[? "audio"] ? "true" : "false";
settingsValues[4] = global.settings[? "musicVolume"];
settingsValues[5] = global.settings[? "sfxVolume"];

// todo use two variables
resolutionScale[0] = "Auto";
resolutionScale[1] = "2560x1440";
resolutionScale[2] = "1920x1080";
resolutionScale[3] = "1366x768";
resolutionScale[4] = "1280x720";
resolutionScale[5] = "800x600";
resolutionScale[6] = "480x320";