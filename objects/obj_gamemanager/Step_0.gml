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
	if keyboard_check(vk_home){
		window_set_fullscreen(true);
	}
	if keyboard_check(vk_end){
		window_set_fullscreen(false);
	}

}

if room == end_screen{
}

//this_room = room_get_name(room);


