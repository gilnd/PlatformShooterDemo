/// @description Main Menu Start

restoreSettingsFromFile();

global.GAME_FPS = 60;
global.GAME_PAUSE = false;
//Inputs
global.InputType = "Keyboard";
global.GamePadIndex = noone;


space = 16;
boxPadding = 32;
padding = 32;

// Title
title = "Project Name!"
titleLenght = string_length(title);
fontSize = font_get_size(fntTitle);

navMenuTipText = "Use arrow keys < > or wasd to move!";
navMenuTipTextLenght = string_length(navMenuTipText);


// Text color
colRed = irandom(100)+155;
colRedCycle = true;
colGreen = irandom(100)+155;
colGreenCycle = true;
colBlue = irandom(100)+155;
colBlueCycle = true;
titleCol = 0;

// Background
backgroundColor = 0;
bckColSaturation = 50;
bckColSaturationIncrease = true;


subMenu = noone

// MENU
menuPage=0;
loadGame();
if(saveFile){
	menu[0] = "Continue"
	menu[1] = "New Game"
	menu[2] = "debug"
	menu[3] = "Settings"
	menu[4] = "Exit"
} else {
	menu[0] = "New Game"
	menu[1] = "debug"
	menu[2] = "Settings"
	menu[3] = "Exit"
}

//maybe not
arrayLength = array_length_1d(menu)

mpos = 0;
lockdown = 0;
lockdownMax = 0;
lockdownDivider = 0;


//Camera Shit ... i mean we should find a way to menage this shitty camera that i hate a lot in every room more nicer, dont we?
// this game is complex to do, fuck everything for nauuuuuu its okay here this shit taken from o camera
target_view = 0;
view_enabled = true;

view_set_visible(target_view, true);
isFullscreen = (global.settings[? "fullscreen"]>0) ? true : false;

var res = global.settings[? "resolutionScale"];
var pos = string_pos("x", res);
log(pos);
log(res);
if (pos!=0 && res != "Auto" && !isFullscreen){
	w = real(string_copy(res, 1, pos-1));
	h = real(string_copy(res, pos+1, string_length(res))); 
	log("res: " + string(w) + "/" + string(h))
} else {
	w = display_get_width();
	h = display_get_height();
	log("res: " + string(w) + "/" + string(h))
}

view_set_wport(target_view, w);
view_set_hport(target_view, h);

window_set_size(w, h)

window_set_position((display_get_width()/2) - (w/2) , (display_get_height()/2) - (h/2));
window_set_fullscreen(isFullscreen);

// Setting up the view
cam = view_camera[target_view];

camera_set_view_size(cam, view_wport[target_view]/global.settings[? "zoom"], view_hport[target_view]/global.settings[? "zoom"]);
//Resize and center
if view_wport[target_view] != surface_get_width(application_surface) || view_hport[target_view] != surface_get_height(application_surface){
   surface_resize(application_surface, view_wport[target_view], view_hport[target_view]);
}

room_width = camera_get_view_width(cam);
room_height = camera_get_view_height(cam);

// Draw box
boxHeight = camera_get_view_height(view_camera[0]) - boxPadding;  
boxWidth = camera_get_view_width(view_camera[0]) - boxPadding;

