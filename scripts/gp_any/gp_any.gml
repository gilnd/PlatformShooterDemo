///@description: it is used to check if the user press any key on the game pad like "vk_anykey" on the keyboard

if (gamepad_is_connected(global.GamePadIndex)) {
	var gp_index, gp_result;
	gp_result = false;
	for(gp_index = 32769; gp_index <= 32788; gp_index++) {
	   if gamepad_button_check_pressed(global.GamePadIndex, gp_index) {
	      gp_result = true;
	   }
	}

	return gp_result;
} else return false;
/*

    gp_face1 (A) is 32769
    gp_face2 (B) is 32770
    gp_face3 (X) is 32771
    gp_face4 (Y) is 32772
    gp_shoulderl (LB) is 32773
    gp_shoulderr (RB) is 32774
    gp_shouldelb (LT) is 32775
    gp_shoulderb (RT) is 32776
    gp_start (Start) is 32778
    gp_select (Select) is 32777
    gp_stickl (Left Stick [button]) is 32779
    gp_stickr (Right Stick [button]) is 32780
    gp_padu (D-Pad Up) is 32781
    gp_padd (D-Pad Down) is 32782
    gp_padl (D-Pad Left) is 32783
    gp_padr (D-Pad Right) is 32784
    gp_axislh (Left Stick Horizontal) is 32785
    gp_axislv (Left Stick Vertical) is 32786
    gp_axisrh (Right Stick Horizontal) is 32787
    gp_axisrv (Right Stick Vertical) is 32788

*/