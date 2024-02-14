
if (!other.isHurt())
{
	other.hurt();
	other.hp--;
	other.vy -= 3;
}

if (owner.x < other.x)
{
	other.vx += 3;
}
else 
{
	other.vx -= 3;
}



