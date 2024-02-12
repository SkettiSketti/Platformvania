spd = 1
maxSpd = 4
maxFallSpd = 6;
maxJumpSpd = 6;
vx = 0
vy = 0
fric = 0.1;
grv = 0.35
// Used for sub-pixel movement
cx = 0;
cy = 0;

function move()
{
	var onStaticGround = place_meeting(x,y+1,oStaticWall) or place_meeting(x,y+2,oStaticWall);
	var blockAbove = place_meeting(x,y-1,oWall);
	var blockBelow = place_meeting(x,y+1,oWall);
	
	//hitting bottom of vertical platform
	var vPlatform = instance_place(x, y-1, oVerticalPlatform);
	if (vPlatform != noone) //did we hit the bottom of a vertical platform?
	{
		//show_debug_message("I'm under a platform");
		if (vPlatform.vy > 0) //moving down
		{
			show_debug_message("crushed going down");
			y += vPlatform.spd;
			if (blockBelow)
			{
				instance_create_layer(x,y,"Instances",oStarParticle);
				instance_destroy();
			}
		}
		
	}
	
	//on top of vertical-moving platform
	var vPlatform = instance_place(x, y+2, oVerticalPlatform);
	if (vPlatform != noone) //did we land on a vertical platform?
	{
		//show_debug_message("I'm on a platform");
		
		if (vPlatform.vy > 0 && onStaticGround)//going down and we're on static ground
		{
			//do nothing
		}
		else
		{
			y += vPlatform.vy;
		}
			
		if (blockAbove && vPlatform.vy < 0) //crushed being pushed up
		{
			show_debug_message("crushed going up");
			instance_create_layer(x,y,"Instances",oStarParticle);
			instance_destroy();
			
			
		}
		
		
		
	}
	
	
	//Source for basic collision code: https://zackbellgames.com/2014/10/28/understanding-collision-basics/
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
			//if we're falling and not touching the platform and the platform is below us
			if (vyNew > 0 and !place_meeting(x,y,oOneWayPlatform) and place_meeting(x,y+1,oOneWayPlatform))
			{
				vy = 0;
			}
			else 
				y += sign(vyNew); 
	    else {
	        vy = 0;
	        break;
	    }
	}

	/*
	// Vertical
	repeat(abs(vyNew)) {
	    if (!place_meeting(x, y + sign(vyNew), oWall))
	        y += sign(vyNew); 
	    else {
	        vy = 0;
	        break;
	    }
	}
	*/

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