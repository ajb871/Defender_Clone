if collision_circle(x,y,12,obj_playerprojectile,false,false) {
	instance_destroy();
}

//Wait for humans to be generated
if instance_exists(obj_human){
	near_human = instance_nearest(x,y,obj_human); //find the nearest human
	if point_distance(x,y,near_human.x,near_human.y) < 500 { //when close enough to one human
		move_towards_point(near_human.x,near_human.y - near_human.sprite_height/2, lander_spd); //move towards them
	} else { //if not near humans
		
	
	
	}
}

//move with scroll
x -= global.scroll_speed;