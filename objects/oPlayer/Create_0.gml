event_inherited();

depth = -1000

spd = 0.75
maxSpd = 2//2.5
maxFallSpd = 20;
maxJumpSpd = 20;
fric = 0.1
grv = 0.45
coyoteTime = 0

attackTime = 10;
attackCoolDownTime = 5;

ducking = false;

function isAttacking(){
	return  (alarm[0] > 0) || (alarm[1] > 0);
}

function isDucking(){
	return ducking;
}