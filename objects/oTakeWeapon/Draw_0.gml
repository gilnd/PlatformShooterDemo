/// @description Insert description here
// You can write your code in this editor
if(can_interact) {
	var oColor = weapon[? "primary_color"];
	if(colorSaturationIncrease){ 
		if(colorSaturation < 100 ) colorSaturation++;
		else colorSaturationIncrease = false;
	}
	else if(!colorSaturationIncrease) {
		if(colorSaturation > 0) colorSaturation--;
		else colorSaturationIncrease = true;
	}
	
	outline_start(1, make_color_hsv(color_get_hue(oColor), colorSaturation, 255));
}

draw_self()
outline_end();