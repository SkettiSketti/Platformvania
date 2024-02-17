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
	
	
	if (onGround())
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
		sprite_index = s_frog_idle;
	}
	else 
	{
		sprite_index = s_frog_jump;
	}
}