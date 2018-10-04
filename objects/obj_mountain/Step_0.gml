x -= global.scroll_speed;

if x > global.right_edge + sprite_width/2{
	x = global.left_edge - sprite_width/2;
}

if x < global.left_edge - sprite_width/2{
	x = global.right_edge + sprite_width/2;
}

