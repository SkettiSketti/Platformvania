hp = 10;


event_inherited();

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