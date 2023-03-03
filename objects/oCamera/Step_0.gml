
if (instance_exists(oPlayer))
{
	lastPosX = oPlayer.x;
	lastPosY = oPlayer.y;
}

//lol
if (keyboard_check_pressed(ord("R")))
{
	game_restart();
}

var xCam = clamp(lastPosX - wCam/2,0,room_width - wCam);
var yCam = clamp(lastPosY - hCam/2,0,room_height - hCam);

var xDirection =  keyboard_check(vk_right) - keyboard_check(vk_left);
var yDirection =  keyboard_check(vk_down) - keyboard_check(vk_up);

if (yDirection != 0)
{
	yCam = clamp(lastPosY- hCam/2 + (yDirection * 64),0,room_height - hCam);
}

if (xDirection != 0)
{
	xCam = clamp(lastPosX- wCam/2 + (xDirection * 64),0,room_width - wCam);
}

show_debug_message(yCam);

var curX = camera_get_view_x(view_camera[0]);
var curY = camera_get_view_y(view_camera[0]);


var newX = lerp(curX, xCam, 0.025);
var newY = lerp(curY, yCam, 0.025);


camera_set_view_pos(view_camera[0],newX,newY);