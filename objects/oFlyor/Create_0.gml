//TODO: Flyors should swoop down when the player is underneath them

event_inherited();

offset = 32;
startX = x;
startY = y-offset;

hp = 3;


moveUp = true;
spd = 0.5;
maxFallSpd = 2;
maxJumpSpd = 2;

aggro = false;



//try to switch directions
function update()
{
	moveUpAndDown();
	clampUpVelocity();
	lookAtPlayer();
	flickerWhenHurt();
	bounceOffWalls();
	checkIfDefeated();
}

function moveUpAndDown()
{
	
	//if (!aggro)
	{
		if (moveUp)
		{
			vy -= spd;
		}
		else if (!moveUp)
		{
			vy += spd;
		}
	
		//swap direction
		if (moveUp and y < startY + offset) //if moving up, then move down
		{
			moveUp = false;
		}
		else if (!moveUp and y > startY - offset) //if moving down, then move up
		{
			moveUp = true;
		}
	}
	/*
	else 
	{
		spd = 0.25
		maxFallSpd = 4;
		if (instance_exists(oPlayer))
		{
			//player is to the left
			if (oPlayer.x < x)
			{
				vx-=spd;
			}
			else  //player is to the right
			{
				vx+=spd;
				
			}
			
			if (oPlayer.y < y)
			{
				vy-=spd;
			}
			else 
			{
				vy+=spd;
			}
		}
	}
	*/
}

function lookAtPlayer()
{
	if (instance_exists(oPlayer))
	{
		
		if (oPlayer.x < x)
		{
			image_xscale = -1;
		}
		else 
		{
			image_xscale = 1;
		}
	}
}

function flickerWhenHurt()
{
	if (hurtTimer > 0)
	{
		//wait for flicker timer to run out
		if (flickerTimer > 0)
		{
			flickerTimer--;
		}
		else 
		{
			if (!flicker)
			{
				image_blend =make_colour_rgb(255, 255, 255);
				flicker = true;
			}
			else 
			{
				image_blend = make_colour_hsv(0, 0, 0);
				flicker = false;
			}
		}
		
		sprite_index = s_flyor_hurt;
		
		hurtTimer--;
	}
	else 
	{
		
		sprite_index = s_flyor_fly;
	}
	
	if (hurtTimer == 1)
	{
		flicker = false;
		
		
	}
}

function hurt()
{
	aggro = true;
	hurtTimer = 30;
}

function bounceOffWalls()
{
	if (vy > 0 and place_meeting(x,y+1,oWall))
	{
		vy = -vy*2;
	}
	/*
	if (vx > 0 and place_meeting(x+1,y,oWall))
	{
		vx = -vx;
	}
	if (vx < 0 and place_meeting(x-1,y,oWall))
	{
		vx = -vx;
	}
	*/
}

function clampUpVelocity()
{
	if (vy < -maxFallSpd)
	{
		vy = -maxFallSpd;
	}
}

function checkIfDefeated()
{
	if (hp < 0)
	{
		instance_destroy();
	}
}