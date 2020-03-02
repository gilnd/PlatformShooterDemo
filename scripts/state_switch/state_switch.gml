///state_switch(state <script or name>,<push to stack?>)
var _push = true;
if(argument_count>1)
  _push=argument[1];  
  
if is_string(argument[0]) {
	if ds_map_exists(state_map,argument[0]) {
		state_next=ds_map_find_value(state_map,argument[0]);
		state_name=argument[0]; 
	}
} else if is_real(argument[0]) { //you passed a specific script, set it as our next state.
  state_next=argument[0];
  state_name=ds_map_find_value(state_keys,argument[0]);
}

if(argument_count > 1 and argument[1]) 
  ds_stack_push(state_stack, state_next);
