wCam = 400
hCam = 300
lastPosX = 0;
lastPosY = 0;

if (instance_exists(oPlayer))
{
	camera_set_view_pos(view_camera[0],clamp(oPlayer.x-wCam/2,0,room_width - wCam),clamp(oPlayer.y-hCam/2,0,room_height - hCam));
}
//window_set_fullscreen(true);