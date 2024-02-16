/// @description Insert description here
// You can write your code in this editor

if (other.isHurt())
{
	return;
}

other.hurt();

if (other.vx-vx < 0)
{
	other.vx = 5;
	vx =- 2;
}
else 
{
	other.vx =- 5;
	vx = 2;
}

//Force player to be forced up regardless of how fast they are moving down
if (other.vy > 0)
{
	other.vy = 0;
}


other.vy -= 3;
