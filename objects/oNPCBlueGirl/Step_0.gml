 /// @description Insert description here
image_xscale = sign(x-oPlayer.x);

if(can_interact){
	if (myDialog == noone){
			myDialog = scrMessageBox("?", "Hey, can you help us?", 1, x, y-sprite_height -4, true);
	}
} else {
	instance_destroy(myDialog);
	myDialog = noone
}
