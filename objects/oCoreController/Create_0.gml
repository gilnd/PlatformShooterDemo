/// @description Core Controller Of the Room
restoreSettingsFromFile();
window_set_fullscreen(global.settings[? "fullscreen"]);

global.GAME_FPS = 60;
global.GAME_PAUSE = false;

//Inputs
global.InputType = "Keyboard";
global.GamePadIndex = noone;

//Create Player & His Stuff/Equip
loadGlobalWeapons()
if(not instance_exists(oPlayer))
	instance_create_layer(x,y,"Main", oPlayer);

if(not instance_exists(oWeapon))
	instance_create_layer(x,y,"Main", oWeapon);

loadGame();

if(not instance_exists(oCheatController))
	instance_create_layer(x,y,"Main", oCheatController);

instance_create_layer(x,y,"Core", oHUD);
instance_create_layer(x,y,"Core", oCamera);
//instance_create_layer(x,y,"Core", oDebug);
instance_create_layer(x,y,"Core", oSilhouette);
//Create Other Controller
instance_create_layer(x,y,"Core", oParallax);
instance_create_layer(x,y,"TopScreen", oGameMenu);
instance_create_layer(x,y,"Core", oEnemyController);



// FPS
room_speed = global.GAME_FPS;

//Clouds

//todo move to oWeather controller
repeat(irandom_range(15,30)) {
	instance_create_layer( irandom_range(0, room_width), irandom_range(sprite_get_height(sClouds), room_height/2),"BackgroundObjects", oCloud);
}

