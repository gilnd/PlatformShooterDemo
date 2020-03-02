/// @description Size Variables and mode setup

w = display_get_width();
h = display_get_height();
h_half = h / 2;

enum TRANS_MODE{
	OFF = -1,
	ON = 4,
	GOTO = 1,
	RESTART_GAME = 3,
	RESTART_ROOM = 2,
	NEXT = 0
}

mode = TRANS_MODE.ON;
percent = 1;
target = room;

movePlayer = false;
targetX = 0;
targetY = 0;