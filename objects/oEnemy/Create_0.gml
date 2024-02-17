
flicker = false;
flickerFrames = 2;
flickerTimer = flickerFrames;
coinsDropped = 8


function checkIfDefeated()
{
	if (hp <= 0)
	{ 
		for (var i = 0; i < coinsDropped; i++)
		{
			instance_create_layer(x,y,"Instances",oCoin);
		}
		instance_destroy();
	}
}

function update(){
	checkIfDefeated();
	flickerWhenHurt();
}

function animateHurt()
{
	//Override
}

function throwCoins()
{
	
}



event_inherited();

