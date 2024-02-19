/// @description Move timer
// You can write your code in this editor

if (instance_exists(oPlayer) && !isHurt())
{
	if (onGround())
	{
		vy -= 3;
	}
	
	if (floor(random_range(0,2)) == 0 && !onGround()) //Mini hop sometimes
	{
		vx += sign(oPlayer.x - x) *  random_range(6,10);
	}
	
	//Move to player
	if ( abs(oPlayer.x - x) > 2 &&  inProximityOfPlayer() && onGround())
	{
		vx += sign(oPlayer.x - x) *  random_range(6,10);
	}
	
	
	
}
alarm[0] = random_range(15,80)
show_debug_message("oSlime: Jump!")
