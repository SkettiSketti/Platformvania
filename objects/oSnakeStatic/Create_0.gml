event_inherited();

spd = 0.12
maxSpd = 4;
grv = 0.10;
hp = 2

//Override
function update(){
	lookAtPlayer();
	checkIfDefeated();
	flickerWhenHurt();
	applyGravity();
	
}