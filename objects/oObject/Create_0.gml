spd = 1
maxSpd = 4
maxFallSpd = 6;
maxJumpSpd = 6;
onPlatform = false;
bouncy = false;
horizontalBounce = false;
flicker = false;
flickerFrames = 2;
flickerTimer = flickerFrames;
vx = 0
vy = 0
fric = 0.1;
grv = 0.35
// Used for sub-pixel movement
cx = 0;
cy = 0;

function onGround()
{
	return (place_meeting(x,y+1,oWall) or instance_place(x, y+1, oVerticalPlatform) or instance_place(x, y+1, oOneWayPlatform))
}

function move()
{
	var onStaticGround = place_meeting(x,y+1,oStaticWall);
	var blockAbove = place_meeting(x,y-1,oWall);
	var blockBelow = place_meeting(x,y+1,oWall);
	var vStaticWallBelow = place_meeting(x,y+1,oStaticWall);
	var vPlatformAbove = instance_place(x, y-1, oVerticalPlatform);
	var vPlatformBelow = instance_place(x, y+1, oVerticalPlatform);
	var vPlatformBelowMovingDown = instance_place(x, y+2, oVerticalPlatform);
	
	//Source for basic collision code: https://zackbellgames.com/2014/10/28/understanding-collision-basics/
	var vxNew, vyNew;

	
	//hitting bottom of vertical platform
	if (vPlatformAbove != noone) //did we hit the bottom of a vertical platform?
	{
		//show_debug_message("I'm under a platform");
		if (vPlatformAbove.vy > 0) //moving down
		{
			y += vPlatformAbove.spd;
			if (blockBelow)
			{
				show_debug_message("oObject: crushed going down");
				instance_create_layer(x,y,"Instances",oStarParticle);
				instance_destroy();
			}
			
		}
		
	}
	
	//on top of vertical-moving platform
	if (vPlatformBelow != noone) //did we land on a vertical platform?
	{
		//show_debug_message("I'm on a platform");
		
		if (vPlatformBelow.vy > 0 && onStaticGround)//platform is going down and we're on static ground
		{
			//do nothing
		}
		else
		{
			y += vPlatformBelow.vy;
		}
		
		
		if (blockAbove && vPlatformBelow.vy < 0) //crushed being pushed up
		{
			show_debug_message("oObject: crushed going up");
			instance_create_layer(x,y,"Instances",oStarParticle);
			instance_destroy();
			
			
		}
		
		
		
	}
	
	//We want to move with a moving platform below us...
	//if we are not touching any other blocks
	if ( vPlatformBelowMovingDown != noone && vPlatformBelowMovingDown.vy > 0 && !blockBelow) 
	{
		show_debug_message("oObject: movedown");
		y += vPlatformBelowMovingDown.vy;
	}
	
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
				if (bouncy)
				{
					vy = -vy*0.90; 
				}
				else 
				{
					vy = 0;
				}
			}
			else 
				y += sign(vyNew); 
	    else {
			if (bouncy)
			{
				vy = -vy*0.90; 
			}
			else 
			{
				vy = 0;
			}
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
			if (bouncy)
			{
				vx = -vx*0.90; 
			}
			else 
			{
				vx = 0;
			}
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
	
	if (vy > maxFallSpd)
	{
		vy = maxFallSpd;
	}
	
	if (vy < -maxFallSpd)
	{
		vy = -maxFallSpd;
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

function applyGravity()
{
	vy += grv;
}

function doFlicker()
{
	
	if (!flicker)
	{
		image_blend =make_colour_rgb(255, 255, 255);
		if (flickerTimer <= 0)
		{
			flicker = true;
			flickerTimer = flickerFrames;
		}
	}
	else 
	{
		image_blend = make_colour_hsv(0, 0, 0);
		if (flickerTimer <= 0)
		{
			flicker = false;
			flickerTimer = flickerFrames;
		}
	}
	flickerTimer--;
		
}
