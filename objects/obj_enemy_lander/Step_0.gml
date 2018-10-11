//Destroy when hit by projectile
if collision_circle(x,y,4,obj_playerprojectile,false,false) {
	instance_destroy();
}


//CAPTURING HUMANS, ROAMING, and FIRING//
	near_human = instance_nearest(x,y,obj_human); //find the nearest human
	
	if (!capturing) & (roaming) & (distance_to_point(near_human.x, near_human.y) < 70){ //when close enough to one human
			move_towards_point(near_human.x,near_human.y, lander_yspd + 1); //move towards them
			//Once the lander hits:
			if distance_to_point(near_human.x, near_human.y) < 5{
				captured_human = near_human; //Set them to "captured human"
				capturing = true; //now capturing!
				roaming = false;
				show_debug_message("CAPTURED HUMAN");
			}
	} else {
		move_towards_point(near_human.x, near_human.y, 0);
	}
	

	
	if (roaming) & (!capturing) { //if not near humans, and roaming
			//Move around inbetween 30 & 180
			y += lander_yspd * lander_ydir;
			if y > 180{
				lander_ydir *= random_range(-1, 1); //either keep going left/right or move up
			} else if y < 30 {
				lander_ydir *= -1;
			}
			x += lander_xspd * lander_xdir;
			show_debug_message("roaming...");
			///////////////Firing Projectiles///////////////
				//if near human and enemy is ON SCREEN and FIRE_READY is true (to control fire rate)
				if (distance_to_point(obj_human.x,obj_human.y) < 80) & (0 < x < room_width) & (fire_ready){
					instance_create_depth(x,y,0,obj_enemyprojectile);//Fire at player!
					fire_ready = false;
					fire_timer = 2.5 * room_speed;
				}
	}
	
	
	
	
	
	if (capturing) { //If currently capturing human
		roaming = false;
		show_debug_message("currently capturing");
		y -= 2; //Go straight up
		captured_human.y -= 2;
		if y < 0 { //Once lander reaches top of screen
			instance_create_depth(x, y, 0, obj_enemy_mutant); //spawn mutant
			instance_destroy(captured_human.id); //destroy human
			instance_destroy(); //destroy self
		}
		
		//If hit by bullet WHILE capturing human
		if collision_circle(x,y,4,obj_playerprojectile, false, false){
			captured_human.fall_height = y; //set height of human during hit
			captured_human.falling = true; //trigger falling for human
			instance_destroy(); //destroy this lander
		}
	}	
	
	
	
//////Firing speed timer!///////
//Only every 2.5 can the enemy fire
if fire_timer > 0 { //If counting down
	fire_ready = false; //no firing
	fire_timer -= 1;
} if fire_timer < 0 {  //Once timer is done
	fire_ready = true; //Ready to fire!
	fire_timer = 2.5 * room_speed; //reset timer
}



//////Move with scroll_speed//////
x -= global.scroll_speed;

if x > global.right_edge + sprite_width/2{
	x = global.left_edge - sprite_width/2;
}
if x < global.left_edge - sprite_width/2{
	x = global.right_edge + sprite_width/2;
}