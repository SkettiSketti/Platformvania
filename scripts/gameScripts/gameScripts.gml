// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function throwCoins(amount){
	for (var i = 0; i < amount; i++)
	{
		instance_create_layer(x,y,"Instances",oCoin);
	}
}

function throwNCoins(px,py,amount){
	for (var i = 0; i < amount; i++)
	{
		instance_create_layer(px,py,"Instances",oCoin);
	}
}

function throwKey()
{
	var key = instance_create_layer(x,y-16,"Instances",oKey);
	key.vy -= 4;
}