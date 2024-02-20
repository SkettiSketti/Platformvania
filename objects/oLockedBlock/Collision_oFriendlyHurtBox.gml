/// @description Insert description here
// You can write your code in this editor

if (global.keys > 0)
{
	repeat(3)
		instance_create_layer(x+random_range(-8, 8),y+random_range(-8, 8),"Instances",oStarParticle);
	instance_destroy()
	global.keys--;
}