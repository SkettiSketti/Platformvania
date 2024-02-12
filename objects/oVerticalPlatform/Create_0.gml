moveUp = false;
moveAmount = 63;
waitAmount = 20;
moveTimer = moveAmount;
waitTimer = 0;
spd = 1;
event_inherited();




//try to switch directions
function update()
{
	if (waitTimer > 0)
	{
		//show_debug_message("Wait!");
		waitTimer--;
		return;
	}
	
	//determine the dirction to move
	var dir = 0;
	if (moveUp)
	{
		dir = -1;
	}
	else 
	{
		dir = 1;
	}

	//Move if the timer isn't done then move
	if (moveTimer > 0)
	{
		vy = spd * dir;
		moveTimer--;
	}
	else //otherwise swap directions (but first wait) 
	{
		vy = 0;
		//swap direction
		if (moveUp)
		{
			moveUp = false;
		}
		else 
		{
			moveUp = true;
		}
		moveTimer = moveAmount;
		waitTimer = waitAmount;
		
	}
	
	
	
	/*
	var player = instance_place(x, y-1, oPlayer);
	if (player != noone) //did we land on a vertical platform?
	{
		show_debug_message("there is something above me");
		if (vx > 0)
		{
			player.y += spd;
		}
		else 
		{
			player.y -= spd;
		}
		
		
	}
	*/
	
}