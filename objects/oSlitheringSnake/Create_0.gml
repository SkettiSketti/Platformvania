event_inherited();

movingLeft = false;

//Override
function update(){
	moveBackAndForth();
	checkIfDefeated();
	flickerWhenHurt();
	applyGravity();
	
}


function moveBackAndForth()
{
	
	if (movingLeft)
	{
		vx -= 0.2;
	}
	else
	{
		vx += 0.2;
	}
	//If there is nothing underneath then move other direction
	if (movingLeft && !collision_point(bbox_left-1,bbox_bottom+1,oWall,false,false))
	{
		movingLeft = false;
	}
	if (!movingLeft && !collision_point(bbox_right+1,bbox_bottom+1,oWall,false,false))
	{
		movingLeft = true;
	}
	
	if (movingLeft && collision_point(bbox_left-1,bbox_bottom-1,oWall,true,false))
	{
		movingLeft = false;
	}
	
	if (!movingLeft && collision_point(bbox_right+1,bbox_bottom-1,oWall,true,false))
	{
		movingLeft = true;
	}
	
	
	if (sign(vx) != 0)
	{
		image_xscale = sign(vx);
	}
	
	
}