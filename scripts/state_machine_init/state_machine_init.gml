///state_machine_init();
///Initilize the variables required for the state engine.

//state
state=noone;
state_next=state;
state_name="UnknownState";
state_timer=0;
state_map=ds_map_create();
state_stack=ds_stack_create();

//behaviour
behaviour = noone;
behaviour_next = behaviour;
behaviour_timer = 0;
behaviour_stack = ds_stack_create();

//Add any new variables you might need for your game here.
//state_can_interrupt=true;
//Good examples might be
//state_can_interrupt = false;
//state_is_invincible = false;
//state_direction = -1;