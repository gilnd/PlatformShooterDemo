/// @description Insert description here

if(can_interact){
	if (myDialog == noone){
			myDialog = scrMessageBox("?.log", "01100001A 01110010r 01101101m", 1, x, y-sprite_height -4, true);
	}
} else {
	instance_destroy(myDialog);
	myDialog = noone
}
