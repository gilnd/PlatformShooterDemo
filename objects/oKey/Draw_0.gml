/// @description Insert description here
// You can write your code in this editor
if(can_interact) {
	#region RGB Random Color Cycle
	// #RED
	if(colRedCycle){
		if(colRed < 255) colRed++;
		else colRedCycle = false;
	} else {
		if(colRed > 0) colRed--;
		else colRedCycle = true;
	}
	// #GREEN
	if(colGreenCycle){
		if(colGreen < 255) colGreen++;
		else colGreenCycle = false;
	} else {
		if(colGreen > 0) colGreen--;
		else colGreenCycle = true;
	}
	// #BLUE
	if(colBlueCycle){
		if(colBlue < 255) colBlue++;
		else colBlueCycle = false;
	} else {
		if(colBlue > 0) colBlue--;
		else colBlueCycle = true;
	}
	#endregion
	outline_start(1, make_color_rgb(colRed, colGreen, colBlue));
}

draw_self()
outline_end()