///behaviour_switch(behaviour, push)
behaviour_next = argument[0]
//behaviour_timer = 0;

if argument_count > 1 and argument[1] {
	log("asd", "added to stack")
	ds_stack_push(behaviour_stack, behaviour_next);
}

  