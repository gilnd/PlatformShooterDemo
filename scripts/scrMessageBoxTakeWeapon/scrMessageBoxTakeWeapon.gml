/// @description scrMessageBox(Weapon Sprite ,"Title", "Text", speed, x, y);
/// @param Weapon Sprite
/// @param "Weapon Name"
/// @param "Weapon Desc"
/// @param speed
/// @param x
/// @param y
/// @param center choose(true,false)

txt = instance_create_layer(argument4, argument5, "Core", oTextTakeWeapon);

with (txt){
	weapSprite = argument0;
	title = argument1;
	padding = 6;
	radius = 6;
	maxLenght = camera_get_view_width(view_camera[0])/2;
	text = argument2;
	spd = argument3;
	font = fnt04b03;
	
	textLenght = string_length(text);
	fontSize = font_get_size(font);
	
	draw_set_font(font);
	
	textWidth = string_width_ext(text, fontSize + (fontSize/2), maxLenght);
	textHeight = string_height_ext(text, fontSize + (fontSize/2), maxLenght);
	
	titleHeight = string_height_ext(title, fontSize + (fontSize/2), maxLenght);
	spriteHeight = sprite_get_height(weapSprite);
	
	boxWidth = textWidth + (padding*2);
	boxHeight = titleHeight + textHeight + spriteHeight + (padding*4);
	if(argument6) x -= boxWidth/2; //Center
	y = y - boxHeight;
}

return txt

