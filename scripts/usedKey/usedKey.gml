ini_open("keys.ini")
var a = ini_read_real("Keys", argument0, 0)
ini_write_real("Keys", argument0, a | 2)
ini_close()