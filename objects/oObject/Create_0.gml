spd = 1
maxSpd = 4
maxFallSpd = 6;
vx = 0
vy = 0
fric = 0.1;
// Used for sub-pixel movement
cx = 0;
cy = 0;

function move()
{
	//Source for collision code: https://zackbellgames.com/2014/10/28/understanding-collision-basics/
	var vxNew, vyNew;

	// Handle sub-pixel movement
	
	//Add velocity to sub pixel acc
	cx += vx;
	cy += vy;
	//get the whole values
	vxNew = round(cx);
	vyNew = round(cy);
	//remove the whole values from sub pixel acc
	cx -= vxNew;
	cy -= vyNew;

	// Vertical
	repeat(abs(vyNew)) {
	    if (!place_meeting(x, y + sign(vyNew), oWall))
	        y += sign(vyNew); 
	    else {
	        vy = 0;
	        break;
	    }
	}

	// Horizontal
	repeat(abs(vxNew)) {

	    // Move up slope
	    if (place_meeting(x + sign(vxNew), y, oWall) && !place_meeting(x + sign(vxNew), y - 1, oWall))
	        --y;
    
	    // Move down slope
	    if (!place_meeting(x + sign(vxNew), y, oWall) && !place_meeting(x + sign(vxNew), y + 1, oWall) && place_meeting(x + sign(vxNew), y + 2, oWall))
	        ++y; 

	    if (!place_meeting(x + sign(vxNew), y, oWall))
	        x += sign(vxNew); 
	    else {
	        vx = 0;
	        break;
	    }
	}
	
	
	


}

function limitVelocity()
{
	if (abs(vx) > maxSpd)
	{
		vx = sign(vx) * maxSpd;
	}
	
	//note: only for falling downwards
	if (vy > maxFallSpd)
	{
		vy = maxFallSpd;
	}
	
}

function applyFriction()
{
	vx += -vx * fric;
	/*
	var onTheGround = place_meeting(x,y+1,oWall);
	if (onTheGround)
	{
		vx += -vx * fric;
	}
	else 
	{
		//less friction when in the air
		vx += -vx * fric/1.25;
	}
	
	*/
}