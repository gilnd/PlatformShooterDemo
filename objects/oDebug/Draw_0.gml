/// @description Insert description here
camX = camera_get_view_x(view_camera[oCamera.target_view]);
camWidth = camera_get_view_width(oCamera.cam);
camY = camera_get_view_y(view_camera[oCamera.target_view]);

padding=8;

draw_set_font(fnt04b03);
draw_set_alpha(1)
draw_set_halign(fa_bottom);
draw_set_valign(fa_left);
draw_set_color(c_white);

draw_text(camX+camWidth-padding, camY+padding,
	"#debug"
	+"\nfps: " + string(fps)
	//+"\nfullscreen: " + string(global.settings[? "fullscreen"]) + " (F11)"
	//+ "\n#player" 
	//+ "\nvsp: " + string(oPlayer.vsp) + " hsp: " + string(oPlayer.hsp)
	+ "\nsprite_index: " + string(oPlayer.sprite_index)
	//+ "\n#WEAPON" 
	+ "\ndir: " + string(oWeapon.dir)
	//+ "\nCamX: " + string(camera_get_view_x(oCamera.target_view))
	//+ "\ncam x: " + string(oCamera.x)
	//+ "\ncam y: " + string(oCamera.y)
	//+ "\nCam xto: " + string(oCamera.xTo)
	//+ "\nCam yto: " + string(oCamera.yTo)
	//+ "\nRoom: " + string(room)
);

//show_debug_overlay(true)

draw_set_halign(fa_top);
draw_set_valign(fa_left);