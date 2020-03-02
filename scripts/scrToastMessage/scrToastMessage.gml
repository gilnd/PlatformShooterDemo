/// @description scrToastMessage("message");
/// @param "message"

camX = camera_get_view_x(view_camera[oCamera.target_view]);
camY = camera_get_view_y(view_camera[oCamera.target_view]);

txt = instance_create_layer(camX, camY, "TopScreen", oToastMessage);

with (txt){
	text = argument0;
	words = string_count(" ", text) + 2; // count number of spaces : words
	font = fnt04b03;
	textLenght = string_length(text);
	fontSize = font_get_size(font);

	maxLenght = camera_get_view_width(view_camera[0])/2;
	textWidth = string_width_ext(text, fontSize + (fontSize/2), maxLenght);
	textHeight = string_height_ext(text, fontSize + (fontSize/2), maxLenght);
	padding = 4;
	radius = 4;

	boxWidth = textWidth + (padding*2);
	boxHeight = textHeight + (padding*2);
	//per ogni parola 1 secondo
	// quindi almeno 1/4 del tempo usarlo per lanimazione
	// 1 scondo = 60;

	time = words * 60;
	animTime = time / 4;

	anim = boxWidth;
	animSpeed = (anim / animTime)*2; // increase/decrease speed
	originAnimSpeed = (anim / animTime)*2; // always stay the same

	alarm[0] = time; // autodestroy
	alarm[1] = animTime * 3; // hide the message box in last 1/4 of time
	audio_play_sound(sndClick, 1 , false);// notification Sound
}

return txt;
