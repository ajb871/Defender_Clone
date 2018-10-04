//////////////////////////Simple Up and Down movement://////////////////////////////
if keyboard_check(vk_up) && y > 30 - sprite_height/2{
	y -= y_spd;
}
if keyboard_check(vk_down) && y < room_height - sprite_height/2{
	y += y_spd
}




//Direction switch with Z
//Player direction will always be 1 or -1
if keyboard_check_pressed(ord("Z")){
	global.player_dir *= -1; //Player direction is multiplied by -1 to switch it
}
// Sprite Direction //
image_xscale = global.player_dir; //-1 or 1 => sprite faces left or right



///////////////////////////Acceleration and Boosting///////////////////////////////
//The ship starts at 0, accelerates up to max speed, and deaccelerates back to 0

if keyboard_check(vk_alt){ //When alt is held
	global.x_velocity += global.accel * global.player_dir; //Add acceleration to x_velocity
														   //and multiply by player_dir to go either LEFT or RIGHT (-1 or 1)
} else { //When alt is not held
	if abs(global.x_velocity) > 0{ //if player is MOVING either direction (speed is over 0)
		//subtract acceleration TIMES the sign (+ or -) of velocity to slow down
		global.x_velocity -= global.accel * sign(global.x_velocity);
	} else {
			global.x_velocity = 0; //OR player is standing still
	}
}

//Use Clamp so that the ship does not go above the Max Speed
global.x_velocity = clamp(global.x_velocity, -global.max_spd, global.max_spd);
//X_velocity is sent to the global scroll var
global.scroll_speed = global.x_velocity;





///////////////////////////////Projectile Firing /////////////////////////////////
if keyboard_check_pressed(vk_control){ //CTRL to fire
	instance_create_depth(x, y, 1, obj_playerprojectile); //create projectile object @ player position
}



///////////////////////////////Enemy Collision /////////////////////////////////
if collision_circle(x,y,12,obj_enemies,false,false){
	
	alarm[1] = 3 * room_speed;
}

