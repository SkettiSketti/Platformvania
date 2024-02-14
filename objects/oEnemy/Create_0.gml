
flicker = false;
flickerFrames = 2;
flickerTimer = flickerFrames;


function checkIfDefeated()
{
	if (hp < 0)
	{
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

