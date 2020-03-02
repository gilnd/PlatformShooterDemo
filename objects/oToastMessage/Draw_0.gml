/// @description
camX = camera_get_view_x(view_camera[oCamera.target_view]);
camY = camera_get_view_y(view_camera[oCamera.target_view]);
camWidth = camera_get_view_width(oCamera.cam);
camHeight = camera_get_view_height(oCamera.cam);

if(camX + camWidth - padding + anim > camX + camWidth - padding && !ending){
	anim -= animSpeed;
	animSpeed *= 1.2;
} else if(ending){
	anim += animSpeed;
	animSpeed *= 1.2;
} else if (!ending){ // reset anim speed
	animSpeed=originAnimSpeed;
}

draw_set_alpha(0.8);
draw_set_color(c_black);
draw_roundrect_ext(camX + camWidth - padding + anim,
	camY + padding,
	camX + camWidth -boxWidth - padding + anim,
	camY + boxHeight,
	radius, radius, false);

//Draw Text
draw_set_halign(fa_right);
draw_set_valign(fa_top);
draw_set_font(font);
draw_set_color(c_white);
draw_set_alpha(1);
//draw_text(camX+camWidth-padding + anim, camY+padding, text);

draw_text_ext_transformed(
	camX+camWidth-padding*2 + anim,
	camY+padding*2,
	text,
	fontSize + (fontSize/2),
	maxLenght,
	1, 1, 0
)

//Clean SHit
draw_set_valign(fa_top);
draw_set_halign(fa_left);
