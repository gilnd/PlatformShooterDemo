/// @description Initialize Player Vars & Stats

event_inherited()

hsp = 0;
vsp = 0;
acc = 0.125 // more realistic
grv = 0.5;
maxhsp = 2.5;
maxvsp = 5
movespeed = 2;		
jumpspeed = 6;

life = 60;
lifeMax = 60;
rechargeLifeHit = 0;

stamina = 70;
staminaMax = 70;
on_ground = false

alarm[0] = 5; //Increase stamina

onDamageState = false;

tempMove = 0;
going = 0

state = "Idle";		//The Current State Of The Player
onDodgeRoll = false;

canWallJump = true;

footstepCount = 1;

myDialog = noone;
debugKPressed = false;
tile_size = 16;
rad = 70;

//Using this vars to remember the last position in ground
onGroundx=0;
onGroundy=0;

behaviour_switch(bhPlayerNormal, true)

inventory = ds_list_create()