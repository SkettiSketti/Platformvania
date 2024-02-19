event_inherited();
grv = 0.1
spd = 5
hp = 3
fric = 0.025
 
//Override
function update(){
	lookAtPlayer();
	checkIfDefeated();
	flickerWhenHurt();
	doFrogThings();
	applyGravity();
	
}

function doFrogThings()
{
	if (inProximityOfPlayer() && onGround() && vy >= 0)
	{
		if (instance_exists(oPlayer))
		{
			if (oPlayer.x > x)
			{
				vx += spd;
			}
			else 
			{
				vx -= spd;
			}
		}
		vy -= 3;
	}
	
	if (onGround())
	{
		sprite_index = s_frog_idle;
	}
	else 
	{
		sprite_index = s_frog_jump;
	}
	
	
}