var xDirection =  keyboard_check(vk_right) - keyboard_check(vk_left);
var jump = keyboard_check_pressed(ord("Z"));
var shoot = keyboard_check_pressed(ord("X"));

var onTheGround = place_meeting(x,y+1,oWall);

if (onTheGround)
{
	coyoteTime =  5;
}
var canJump = onTheGround or (coyoteTime > 0);

if (coyoteTime > 0)
{
	coyoteTime--;
}

if (xDirection != 0) image_xscale = xDirection;


vx += xDirection * spd;
vy += 0.35;


if (canJump)//(onTheGround)
{
	if (xDirection != 0)
	{
		sprite_index = blue_cat_walk;
	}
	else 
	{
		sprite_index = blue_cat_idle;
	}
	
	if (jump)
	{
		vy = -6;
	}

	
}
else 
{
	sprite_index = blue_cat_idle;
}

if (shoot)
{
	if (keyboard_check(vk_up))
	{
		projectile = instance_create_layer(x,y,"Instances",oFriendlyProjectile);
		projectile.vy = -projectile.spd;
		projectile.image_angle += 90;
	}
	else if (keyboard_check(vk_down))
	{
		projectile = instance_create_layer(x,y,"Instances",oFriendlyProjectile);
		projectile.vy = projectile.spd;
		projectile.image_angle += 90;
	}
	else 
	{
		projectile = instance_create_layer(x + 10 * sign(image_xscale) ,y,"Instances",oFriendlyProjectile);
		projectile.vx = sign(image_xscale) * projectile.spd ;
	}
}


event_inherited();

