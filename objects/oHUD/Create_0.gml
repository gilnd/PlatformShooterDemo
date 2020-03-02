/// @description Init

showHud = true;


customAlpha = 1;
alarm[0] = 5;

// GUI Vars
margin = 4;
spaceBetween = 2;

staminabarHeight = 2;
staminabarWidth = oPlayer.staminaMax;

weaponBoxHeight = sprite_get_height(sWeaponIndicator);
weaponBoxWidth = sprite_get_width(sWeaponIndicator);

lifebarHeight = 2;
lifebarWidth = oPlayer.lifeMax;

playerBarsHeight = staminabarHeight + lifebarHeight + spaceBetween * 2 + 5;
playerBarsWidth = max(staminabarWidth, lifebarWidth);

ammoIndicatorHeight = sprite_get_height(sAmmoIndicator);
ammoIndicatorWidth = sprite_get_width(sAmmoIndicator);