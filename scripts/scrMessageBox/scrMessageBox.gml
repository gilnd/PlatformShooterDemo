/// @description scrMessageBox("Title", "Text", speed, x, y);
/// @param "Title"
/// @param "Text"
/// @param speed
/// @param x
/// @param y
/// @param center choose(true,false)

txt = instance_create_layer(argument3, argument4, "Core", oText);

with (txt){
	title = argument0;
	padding = 6;
	radius = 6;
	maxLenght = camera_get_view_width(view_camera[0])/2;
	text = argument1;
	spd = argument2;
	font = fnt04b03;
	
	textLenght = string_length(text);
	fontSize = font_get_size(font);
	
	draw_set_font(font);
	
	textWidth = string_width_ext(text, fontSize + (fontSize/2), maxLenght);
	textHeight = string_height_ext(text, fontSize + (fontSize/2), maxLenght);
	titleWidth = string_width_ext(title, fontSize + (fontSize/2), maxLenght);
	titleHeight = string_height_ext(title, fontSize + (fontSize/2), maxLenght);
	
	boxWidth = (textWidth > titleWidth) ? textWidth + (padding*2) : titleWidth + (padding*2);
	boxHeight = titleHeight + textHeight + (padding*2);
	if(argument5) x -= boxWidth/2; //Center
	y = y - boxHeight;
}

return txt

