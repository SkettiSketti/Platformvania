event_inherited();

spd = 0.12
maxSpd = 4;
grv = 0.10;
hp = 100

//Override
function update(){
	lookAtPlayer();
	checkIfDefeated();
	flickerWhenHurt();
	doSlimeThings();
	applyGravity();
	
}

function doSlimeThings(){
	if (alarm[0] < 0)
	{
		alarm[0] = 120;
	}
	//Move toward player
	/*
	if (instance_exists(oPlayer) && !isHurt())
	{
		if (abs(oPlayer.x - x) > 2 && distance_to_object(oPlayer) < 240 && hurtTimer <= 0)
		{
			if (oPlayer.x < x)
			{
				vx -= spd;
			}
			else if (oPlayer.x > x)
			{
				vx += spd;
			}
		}
	}
	*/
	
	if (hurtTimer > 0)
	{
		depth = -10;
	}
	else
	{
		depth = 0;
	}
	
	
	

}