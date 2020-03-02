///state_switch_previous(pop)
var _pop = true;

if argument_count > 0 {
	_pop = argument[0]
}

if _pop {
	ds_stack_pop(behaviour_stack);
}
var _state = ds_stack_top(behaviour_stack);

if(_state != undefined){
	behaviour_switch(_state, false);
}