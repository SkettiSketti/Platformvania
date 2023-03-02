event_inherited();
maxSpd = 6;
spd = 6;
ttl = 7; //time to live

function checkTTL()
{
	if (ttl > 0)
	{
		ttl--;
	}
	else 
	{
		instance_destroy();
		instance_create_layer(x,y,"Particles",oStarParticle)
	}
}

//override
function move()
{
	x += vx;
	y += vy;
}