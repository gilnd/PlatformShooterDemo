/// @description Insert description here
// You can write your code in this editor
// SETTINGS

//WORDS
if not canDraw {
	return
}

draw_set_font(fnt04b03);
draw_set_color(c_ltgray);
draw_set_alpha(0.6);
			
var maxElements = floor(totalHeightSpace/16);
var start = max((subMpos-maxElements) + 1, 0)

///todo
var stop = min(start+maxElements, array_length_1d(settingsMenu))
var cy = 0;
			
draw_set_halign(fa_right);
					
draw_set_halign(fa_left);
			
for(var i=start; i < stop; i++){
	if(i == subMpos){
		//draw_set_color(tempCol);
		draw_set_alpha(1);
		draw_set_color(c_white);
		draw_rectangle(boxPadding - 8, titleBoxHeight + (cy * 16) - 6, boxWidth + 8, titleBoxHeight + (cy * 16) + 6, false);
		draw_set_color(c_black);
		draw_text(boxPadding, titleBoxHeight + (cy * 16) -4 , "> " + string(settingsMenu[i]));
		if(i<=5)
			draw_text(boxWidth/2, titleBoxHeight + (cy * 16) -4 , "< " + string(settingsValues[i]) + " >");
	} else {
		draw_set_color(c_ltgray);
		draw_set_alpha(0.6);
		draw_text(boxPadding, titleBoxHeight + (cy * 16) -4 , string(settingsMenu[i]));
		if(i<=5) 
			draw_text(boxWidth/2, titleBoxHeight + (cy * 16) -4 , "< " + string(settingsValues[i]) + " >");
	}
	cy++;
}