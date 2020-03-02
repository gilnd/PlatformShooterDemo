///findWeapon(weaponId)
with(oWeapon) {
	var len = array_length_1d(weapons)
	for(var i = 0; i < len; i++) {
		var w = weapons[i]
		if(w[? "id"] == argument0)
			return i
	}
}

return -1
