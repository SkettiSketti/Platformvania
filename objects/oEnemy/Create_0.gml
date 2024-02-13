hurtTimer = 0;
flicker = false;
flickerFrames = 2;
flickerTimer = flickerFrames;


function checkIfDefeated()
{
	if (hp < 0)
	{
		instance_destroy();
	}
}

function update(){
	checkIfDefeated();
	flickerWhenHurt();
}

function hurt()
{
	aggro = true;
	hurtTimer = 30;
}

function animateHurt()
{
	//Override
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


event_inherited();

