if room == start_screen{
	if keyboard_check_pressed(ord("1")){
		room_goto(game);
		show_debug_message("game started");
	}
} 

if room == game{

	global.game_time += (1 / room_speed); //seconds
	if keyboard_check(vk_escape) {
		game_end();
	}
	//Toggle fullscreen with home & end:
	if keyboard_check(vk_home){
		window_set_fullscreen(true);
	}
	if keyboard_check(vk_end){
		window_set_fullscreen(false);
	}
	
	if instance_number(obj_human) == 0 {
		room_goto(human_end_screen);
	}
	
	//Variable to control capturing humans -> if any are already being captured, do not seek
	with (obj_enemy_lander) {
	    if (capturing == true){
			global.any_capturing = true;
		} else {
			global.any_capturing = false;
		}
	}
}

//End game when out of Lives


if room == end_screen || room == human_end_screen{
	if keyboard_check(ord("1")){
		//Reset all variables
		global.points = 0;
		global.player_lives = 3;
		global.game_time = 0;
		room_goto(game);
	}
}




