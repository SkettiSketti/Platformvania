event_inherited();

//override
function applyFriction()
{
	vx += -vx * fric;
	vy += -vy * fric;
}