/// @description Insert description here
// You can write your code in this editor

x = owner.x;
if (!owner.isDucking())
{
	y = owner.y;
}
else 
{
	y = owner.y + 5;
}

if (!owner.isAttacking())
{
	instance_destroy();
}


