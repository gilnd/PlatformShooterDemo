global.GAME_PAUSE = true;
with(oPlayer) {
	//removing player move state
	oPlayer.hsp=0;
	oPlayer.sprite_index = sPlayerIdle;
	behaviour_switch(bhPlayerIdle, false);
}