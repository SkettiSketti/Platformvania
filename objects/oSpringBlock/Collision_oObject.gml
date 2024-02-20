/// @description Insert description here
// You can write your code in this editor

if (!animating)
{
	audio_play_sound(sndBoing2,10,false);
	animating = true;
}

if (other.vy > 0)
{
	other.vy = 0;
	other.vy -= 8
	image_speed = 1
}

