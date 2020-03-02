///behaviour_switch_previous()
ds_stack_pop(behaviour_stack);
var _state=ds_stack_top(behaviour_stack);
if(_state != undefined){
	state_switch(_state);
}