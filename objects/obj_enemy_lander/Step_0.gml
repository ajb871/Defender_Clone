if collision_circle(x,y,12,obj_playerprojectile,false,false) {
	instance_destroy();
}

//Wait for humans to be generated
if instance_exists(obj_human){
	near_human = instance_nearest(x,y,obj_human); //find the nearest human
	if point_distance(x,y,near_human.x,near_human.y) < 50 { //when close enough to one human
		move_towards_point(near_human.x,near_human.y - near_human.sprite_height/2, lander_spd + 1); //move towards them
	} else { //if not near humans
		y += lander_spd * lander_dir;
		if y > 160{
			lander_dir *= -1;
		} else if y < 30 {
			lander_dir *= -1;
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