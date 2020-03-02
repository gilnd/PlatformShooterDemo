/// @description

if msg != noone {
	#region Add letters over time
	
	
	 if printed_timer >= 0 {
		if (printed_timer < textLenght){
			printed_timer += spd;
			printed_text = string_copy(msg[?"text"], 0, printed_timer);
		} else {
			printed_timer = -1
		}
	}
	
	
	#endregion

	#region Render TextBox & Text
	draw_set_alpha(alpha);
	if (alpha < 0.8) alpha += spd/10 else alpha = 0.8;

	draw_set_font(font);
	draw_set_color(c_black);
	draw_roundrect_ext(x, y, x+boxWidth, y+boxHeight, radius, radius, 0);

	draw_set_halign(fa_left);
	draw_set_valign(fa_top);

	//Draw Title
	var title = ds_map_get(msg, "title", noone)
	if title != noone {
		draw_set_color(c_orange);
		draw_text_transformed(x+padding,y+padding,title, 1, 1, 0);
	}
	//Draw Text
	draw_set_color(c_white);
	draw_text_ext_transformed(
		x+padding,
		y+titleHeight+padding,
		printed_text,
		fontSize + (fontSize/2),
		maxLenght,
		1, 1, 0
	)
	#endregion
	
	if printed_timer < 0 and ds_map_get(msg, "interactive", false) {
		draw_set_valign(fa_top);
		draw_set_halign(fa_left);
		draw_set_alpha(1);
		draw_set_color(c_white);
		draw_roundrect_ext(x + boxWidth -6, y + boxHeight-6, x + boxWidth + 2, y + boxHeight + 2, 3, 3, false);
		draw_set_color(c_black)
		draw_text(x + boxWidth-3, y + boxHeight-5, scrGetInputTypeDeviceChar());
	}
	

	draw_set_alpha(1);

	//Clean SHit
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
}