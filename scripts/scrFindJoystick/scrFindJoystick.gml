switch(async_load[? "event_type"]){					// Parse the async_load map to see which event has been triggered
	case "gamepad discovered":						// A game pad has been discovered
	    var pad = async_load[? "pad_index"];		// Get the pad index value from the async_load map
	    //gamepad_set_axis_deadzone(pad, 0.5);//0.5		// Set the "deadzone" for the axis
	    //gamepad_set_button_threshold(pad, 0.1);		// Set the "threshold" for the triggers
		global.GamePadIndex = pad;
	    break;
	case "gamepad lost":							// Gamepad has been removed or otherwise disabled
	    var pad = async_load[? "pad_index"];		// Get the pad index
		//global.GamePadIndex[pad] = noone;
	    break;
}