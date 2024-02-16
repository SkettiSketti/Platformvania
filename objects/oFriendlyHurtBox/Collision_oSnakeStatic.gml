if (!other.isHurt())
{
	other.hurt();
	other.hp--;
}

if (owner.x < other.x)
{
	other.vx += owner.knockBack;
}
else 
{
	other.vx -= owner.knockBack;
}



