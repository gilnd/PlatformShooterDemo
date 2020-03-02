/// @description Insert description here
// You can write your code in this editor

if ds_queue_size(dialog) > 0 or msg != noone {
	if msg == noone {
		msg = ds_queue_dequeue(dialog)
		
		//clean up
		timer = 0
		printed_timer = 0
		printed_text = ""
		
		textLenght = string_length(msg[?"text"])
	
		textWidth = string_width_ext(msg[?"text"], fontSize + (fontSize/2), maxLenght);
		textHeight = string_height_ext(msg[?"text"], fontSize + (fontSize/2), maxLenght);
		var title = ds_map_get(msg, "title", noone)
		
		if title != noone {
			titleWidth = string_width_ext(title, fontSize + (fontSize/2), maxLenght);
			titleHeight = string_height_ext(title, fontSize + (fontSize/2), maxLenght);
		} else {
			titleWidth = 0
			titleHeight = 0
		}
	
		boxWidth = (textWidth > titleWidth) ? textWidth + (padding*2) : titleWidth + (padding*2);
		boxHeight = titleHeight + textHeight + (padding*2);
		
		var anchor = ds_map_get(msg, "speaker", speaker);
		
		x = anchor.x - boxWidth/2; 
		y = anchor.y - boxHeight;
	} else if printed_timer < 0 { // text has been typed
		if ds_map_get(msg, "interactive", false) {
			scrGetPlayerEventInput()
			if key_interact > 0 {
				msg = noone
			}
		} else if timer > ds_map_get(msg, "timeout", 150) {
			msg = noone
		}
	}
} else {
	instance_destroy()
}

timer += 1
