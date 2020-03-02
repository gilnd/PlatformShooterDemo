//format(string args...)

var s = argument[0]
var i = 1
var cur = string_pos("{}", s)

while(cur != 0 && i < argument_count) {
	s = string_replace(s, "{}", string(argument[i]))
	i += 1
	cur = string_pos("{}", s)
}

return s