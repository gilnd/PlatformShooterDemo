///log(tag, args...)

r = "[" + string(argument[0]) + "]"

if(argument_count > 1) {
	r += ": "
	for (i = 1; i < argument_count - 1; i++) {
	    r += string(argument[i]) + ", "
	}
	r += string(argument[i])
}

show_debug_message(r)