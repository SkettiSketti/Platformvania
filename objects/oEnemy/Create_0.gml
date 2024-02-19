
flicker = false;
flickerFrames = 2;
flickerTimer = flickerFrames;
coinsDropped = 8


function checkIfDefeated()
{
	if (hp <= 0)
	{ 
		throwCoins(coinsDropped);
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




event_inherited();

