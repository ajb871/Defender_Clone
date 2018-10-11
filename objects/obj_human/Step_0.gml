x -= global.scroll_speed;

if x > global.right_edge + sprite_width/2{
	x = global.left_edge - sprite_width/2;
}

if x < global.left_edge - sprite_width/2{
	x = global.right_edge + sprite_width/2;
}

//If off the ground and being dropped... (i.e. lander was shot down)
if (falling){
	show_debug_message("here i go");
	//Player can "Catch" falling humans!!
	if collision_circle(x,y, 8,obj_player, false, false){ //If player collides
		falling = false; //no longer fallnig
		carried = true; //trigger "carried" event
		show_debug_message("caught human!");
		global.points += 500; //500 points for catching human
	}
	
	if y < global.ground { //While above ground
		y += grav; //fall downwards
	} else if y == global.ground { //Once human hits ground
		//Determine whether or not they survived from the height they were dropped
		if fall_height < 150 { //if height is under 150
			instance_destroy(); //they are destroyed
		} else { //else (if height over 150)
			y = global.ground; //set on ground
			falling = false; //they live, and variables are reset
			fall_height = 0;
			global.points += 250; //250 pts for safe landing
			show_debug_message("human fell safely...");
		}
	}
}

if (carried){
	show_debug_message(y);
	show_debug_message("ground: " + string(global.ground));
	falling = false;
	x = obj_player.x; //Follow player location!
	y = obj_player.y;
	if y > global.ground - 15 { //Once at ground!
		show_debug_message("grounded human!");
		global.points += 500; //500 pts for landing with human
		y = global.ground; //Stay on ground
		carried = false; //Reset variables
	}
}

//Destroy when hit by player projectile
if collision_circle(x,y,4,obj_playerprojectile,false,false) {
	instance_destroy();
	global.points -= 150; //subtract points
}
