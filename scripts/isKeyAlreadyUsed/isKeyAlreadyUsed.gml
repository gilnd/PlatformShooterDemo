ini_open("keys.ini")
var res = false 
if ini_key_exists("Keys", argument0) {
	res = (2 & ini_read_real("Keys", argument0, 0)) == 2
} 
ini_close()
return res