/// @description Move timer
// You can write your code in this editor

if (instance_exists(oPlayer) && !isHurt())
{
	if (onGround())
	{
		vy -= 3;
	}
	vx += sign(oPlayer.x - x) *  random_range(6,8);
	
	//Move to player
	if ( abs(oPlayer.x - x) > 2 &&  distance_to_object(oPlayer) < 120)
	{
		if (oPlayer.x < x)
		{
			vx -= 5;
		}
		else if (oPlayer.x > x)
		{
			vx += 5;
		}
	}
}
alarm[0] = random_range(15,80)
show_debug_message("oSlime: Jump!")
