//Multiply spd by Player_dir (-1 or 1) to shoot correct direction
x += spd * bullet_direction; 


//Destroy if it leaves the frame
if x > room_width || x < 0 {
	instance_destroy();
}

