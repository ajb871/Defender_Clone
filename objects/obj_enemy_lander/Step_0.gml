//Destroy when hit by projectile
if !capturing & collision_circle(x,y,9,obj_playerprojectile,false,false) {
	bullet = instance_nearest(x,y,obj_playerprojectile);
	instance_destroy(bullet);
	instance_destroy();
	global.points += 150;
}


//CAPTURING HUMANS, ROAMING, and FIRING//
if instance_exists(obj_human){
	near_human = instance_nearest(x,y,obj_human); //find the nearest human
	
	//Not currently capturing a human, is near a human, the human is not being captured, and no other humans are being captured...
	if (!capturing) & (distance_to_point(near_human.x, near_human.y) < 55) & (!near_human.being_captured) & (!global.any_capturing){ //when close enough to one human who ISNOT being captured
			if global.any_capturing{
				roaming = true;
				seeking_human = false;
			}
			roaming = false;
			seeking_human = true;
			move_towards_point(near_human.x,near_human.y, lander_yspd); //move towards them
			//Once the lander hits:
			if (distance_to_point(near_human.x, near_human.y) < 10) & (!near_human.being_captured){
				captured_human = near_human; //Set them to "captured human"
				capturing = true; //now capturing!
				roaming = false;
				captured_human.being_captured = true;
				show_debug_message("CAPTURED HUMAN");
			}
	} else {
		move_towards_point(near_human.x, near_human.y, 0);
	}
	

	
	if (roaming) & (!capturing) & (!seeking_human) { //if not near humans, and roaming
			//Move around inbetween 30 & 180
			y += lander_yspd * lander_ydir;
			if y > 180{
				lander_ydir *= random_range(-1, 1); //either keep going left/right or move up
			} else if (y < 38 + sprite_height/2) {
				lander_ydir *= -1;
			}
			x += lander_xspd * lander_xdir;
			///////////////Firing Projectiles///////////////
				//if near human and enemy is ON SCREEN and FIRE_READY is true (to control fire rate)
				if (distance_to_point(obj_human.x,obj_human.y) < 80) & (!seeking_human) & (fire_ready){
					instance_create_depth(x,y,0,obj_enemyprojectile);//Fire at player!
					show_debug_message("FIRING @ PLAYER!");
					fire_ready = false;
					fire_timer = 2.5 * room_speed;
				}
	}	
	
	
	if (capturing) { //If currently capturing human
		y -= 1.2; //Go straight up with human
		captured_human.y = y + captured_human.sprite_height; //human follows
		if y < 38 + sprite_height/2 { //Once lander reaches top of screen
			instance_create_depth(x, y, 0, obj_enemy_mutant); //spawn mutant
			instance_destroy(captured_human.id); //destroy human
			instance_destroy(); //destroy self
		}
		
		//If hit by bullet WHILE capturing human
		if collision_circle(x,y,6,obj_playerprojectile, false, false){
			show_debug_message("HUMAN FALLING NOW");
			captured_human.fall_height = y; //set height of human during hit
			near_human.fall_height = y;
			near_human.falling=true;
			captured_human.falling = true; //trigger falling for human
			instance_destroy(); //destroy this lander
		}
		
		//If human is already being captured 

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