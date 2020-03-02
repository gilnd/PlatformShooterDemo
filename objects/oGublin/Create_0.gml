/// @description Init
event_inherited()
sprite_reversed = false

life = 20000//irandom_range(60, 80);
onAlarm = false;
hsp = 0
vsp = 0

movespeed = 0.7;		
jumpspeed = 4;
jumping = false

//jump stuff
jump_release = true
jump = 0
should_jump = true

going = 0

range = 300
diffx = 0
diffy = 0

// States
state_create("Idle", stateIdle)
state_create("Walk", stateWalkAround)
state_create("Jump", stateJump)

state_switch("Idle")

weapon = instance_create_depth(x,y, depth, oEnemyWeapon)
with(weapon) {
	anchor = other
	var inde = irandom_range(0, array_length_1d(global.weapon_array)-1)
	weapon = ds_map_clone(global.weapon_array[inde]);
	weapons[0] = weapon
	currentWeaponIndicator = 0
}

behaviour_switch(bhFollowPlayer, true)


sprite_idle = sGublinIdle
sprite_run = sGublinRun
sprite_jump = sGublinJump