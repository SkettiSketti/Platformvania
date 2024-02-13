other.hurt();
other.hp--;

if (vx > 0)
{
	other.vx += 3;
}
else 
{
	other.vx -= 3;
}
other.vy -= 3;


instance_destroy();