hp = 10;
hurtTimer = 0;

knockUp = 3;
knockBack = 3;

event_inherited();

function hurt()
{
	aggro = true;
	hurtTimer = 30; //We are hurt
}

function isHurt()
{
	return (hurtTimer > 0);
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

function animateHurt(){
}

function flickerWhenHurt()
{
	if (hurtTimer > 0)
	{
		if (!flicker)
		{
			image_blend =make_colour_rgb(255, 255, 255);
			if (flickerTimer <= 0)
			{
				flicker = true;
				flickerTimer = flickerFrames;
			}
		}
		else 
		{
			image_blend = make_colour_hsv(0, 0, 0);
			if (flickerTimer <= 0)
			{
				flicker = false;
				flickerTimer = flickerFrames;
			}
		}
		flickerTimer--;
		
		hurtTimer--;
	}
	
	animateHurt();
	
	if (hurtTimer == 1)
	{
		flicker = false;
		
		
	}
}

function inProximityOfPlayer()
{
	return (instance_exists(oPlayer) && distance_to_object(oPlayer) < 160)
}
