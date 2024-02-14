hp = 10;
flicker = false;
flickerFrames = 2;
flickerTimer = flickerFrames;
hurtTimer = 0;

event_inherited();

function hurt()
{
	aggro = true;
	hurtTimer = 45; //We are hurt
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
		
		
		hurtTimer--;
	}
	
	animateHurt();
	
	if (hurtTimer == 1)
	{
		flicker = false;
		
		
	}
}
