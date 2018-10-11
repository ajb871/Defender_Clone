//Destroy when hit by projectile
if collision_circle(x,y,4,obj_playerprojectile,false,false) {
	instance_destroy();
}

//Wait for humans to be generated
if instance_exists(obj_human){
	near_human = instance_nearest(x,y,obj_human); //find the nearest human

	if capturing == false{ //If NOT currently capturing
		if distance_to_point(near_human.x, near_human.y) < 90{ //when close enough to one human
			move_towards_point(near_human.x,near_human.y, lander_yspd + 1); //move towards them
			//Once the lander hits:
			if collision_circle(x,y, 20, near_human, false, false){
				capturing = true;
			}
		}
		else { //if not near humans
			//Move around inbetween 30 & 180
			y += lander_yspd * lander_ydir;
			if y > 180{
				lander_ydir *= random_range(-1, 1); //either keep going left/right or move up
			} else if y < 30 {
				lander_ydir *= -1;
			}
			x += lander_xspd * lander_xdir;
		}
	} else if capturing == true { //If capturing human
		y -= lander_yspd; //Go straight up
		if y < 0 { //Once lander reaches top of screen, spand mutant & destroy this instance
			instance_create_depth(x, y, 0, obj_enemy_mutant);
			instance_destroy();
		}
	}	
}





//Move with scroll_speed
x -= global.scroll_speed;

if x > global.right_edge + sprite_width/2{
	x = global.left_edge - sprite_width/2;
}
if x < global.left_edge - sprite_width/2{
	x = global.right_edge + sprite_width/2;
}