/// @description Insert description here
#region RGB Random Color Cycle
// #RED
if(colRedCycle){
	if(colRed < 255) colRed++;
	else colRedCycle = false;
} else {
	if(colRed > 155) colRed--;
	else colRedCycle = true;
}
// #GREEN
if(colGreenCycle){
	if(colGreen < 255) colGreen++;
	else colGreenCycle = false;
} else {
	if(colGreen > 155) colGreen--;
	else colGreenCycle = true;
}
// #BLUE
if(colBlueCycle){
	if(colBlue < 255) colBlue++;
	else colBlueCycle = false;
} else {
	if(colBlue > 155) colBlue--;
	else colBlueCycle = true;
}
#endregion

// BOX WHERE I DRAW SHIT
tempCol = make_color_rgb(colRed, colGreen, colBlue);
boxHeight = camera_get_view_height(view_camera[target_view]) - boxPadding;  
boxWidth = camera_get_view_width(view_camera[target_view]) - boxPadding;


draw_set_alpha(1);

// TITLE
draw_set_font(fntTitle)
fontSize = font_get_size(fntTitle);
draw_set_color(tempCol)
titleHeight = string_height_ext(title, fontSize + (fontSize/2), camera_get_view_width(view_camera[target_view]));
draw_set_color(c_white)
draw_text(padding, padding, title);

// VERSION
draw_set_font(fnt04b03)
fontSize = font_get_size(fnt04b03);
var versionString = format("V:{}", GM_version)
versionHeight = string_height(versionString);
draw_text(padding, padding + titleHeight, versionString);

titleBoxHeight = titleHeight + padding + versionHeight + padding/2;


#region MAIN MENU DRAW
fontSize = font_get_size(fnt04b03);
draw_text(padding, boxHeight, navMenuTipText);
navMenuTipTextHeight = string_height_ext(navMenuTipText, fontSize + (fontSize/2), camera_get_view_width(view_camera[target_view]));


//animation stuff
var _amt = 0;
if (lockdown > 0) _amt = (lockdown/lockdownMax);

// start draw items from this element
c = mpos - 1

// u may want to adjust the right margin
var l = 0

var offsetMenu = 0;
if lockdown > 0 then offsetMenu = round(string_width(menu[mpos]) + padding) * _amt;
draw_set_font(fnt04b03);

while(l < w) {
	var j = c mod arrayLength
	
	//note if j is <0 get his opposite
	var i = j < 0 ? arrayLength + j : j
	var current = (c == mpos)
	
	//setup colors
	if (current) {
		draw_set_color(tempCol);
		draw_set_alpha(1)
		draw_text(l + offsetMenu, boxHeight-navMenuTipTextHeight-padding + padding/3, string_upper(menu[i]));
	} else {
		draw_set_color(c_white);
		draw_set_alpha(0.3);	
		draw_text(l + offsetMenu, boxHeight-navMenuTipTextHeight-padding + padding/3, menu[i]);
	}
	
	// right divisor
	draw_rectangle(
		l + offsetMenu - padding/2, boxHeight-navMenuTipTextHeight-padding/2, 
		l + offsetMenu - padding/2, boxHeight-navMenuTipTextHeight-(padding/2+padding/6), false);
	
	// spacing
    l += round(string_width(menu[i])) + padding;
	
	// left divisor
    draw_rectangle(
		l + offsetMenu - padding/2, boxHeight-navMenuTipTextHeight-padding/2, 
		l + offsetMenu - padding/2, boxHeight-navMenuTipTextHeight-(padding/2+padding/6), false);   
    c++;
}

draw_set_alpha(1);
draw_set_color(c_white);
#endregion

var mainMenuHeight = navMenuTipTextHeight + padding;
totalHeightSpace = boxHeight - titleBoxHeight - mainMenuHeight;

if(instance_exists(subMenu)){
	with(subMenu) {
		boxWidth = other.boxWidth
		boxHeight = other.boxHeight
		//i think is enaught tyo pass a start x, y
		// and the max with and height and the color but i wont refactor that 
		tempCol = other.tempCol
		boxPadding = other.boxPadding
		titleBoxHeight = other.titleBoxHeight
		totalHeightSpace = other.totalHeightSpace	
		canDraw = true;
	}

}

// BACKGROUND COLOR
if(bckColSaturationIncrease){ 
	if(bckColSaturation < 45 ) bckColSaturation+=random_range(0.1, 1);
	else bckColSaturationIncrease = false;
} else if(!bckColSaturationIncrease) {
	if(bckColSaturation > 0) bckColSaturation-=random_range(0.1, 1);
	else bckColSaturationIncrease = true;
}

layer_background_blend(layer_background_get_id(layer_get_id("Background")),
			make_color_hsv(0,0,bckColSaturation));// make_color_rgb(25, 25, 25)//make_color_hsv(color_get_hue(background_color), bckColSaturation, 255));

//EFFECTS

/*
B = instance_create_depth(irandom(room_width),irandom(room_height),depth+1,oSfxSpark);
B.direction = random(360);//mean(90,90,mean(choose(0,180),random(360)));
B.speed = random_range(0.5,3)
B.dir = irandom(360);
B.colour1 = make_color_rgb(irandom(255),irandom(255),irandom(255));
B.colour2 = make_color_rgb(irandom(255),irandom(255),irandom(255));
B.decrease = mean(1,random_range(0.90,0.99))/random_range(1,1.2);

C = instance_create_depth(irandom(room_width), irandom(room_height), depth+1, oSfxCircle);
C.direction = random_range(0,360);//mean(90,90,mean(choose(0,180),random(360)));
C.speed = random_range(0.5,3)
C.dir = irandom(360);
C.col1 = make_color_rgb(irandom(255),irandom(255),irandom(255));
C.col2 = make_color_rgb(irandom(255),irandom(255),irandom(255));
C.decrease = mean(1,random_range(0.90,0.99))/random_range(1,1.2);
*/

