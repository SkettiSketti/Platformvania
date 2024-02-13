/// @description Move timer
// You can write your code in this editor

var onGround = place_meeting(x,y+1,oWall);
if (instance_exists(oPlayer))
{
	if (abs(oPlayer.x - x) > 2 && distance_to_object(oPlayer) < 240 && onGround)
	{
		vy -= 4;
	}
}
alarm[0] = random_range(60,120)
show_debug_message("oSlime: Jump!")
