if room == start_screen{
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_color(c_aqua);
	draw_set_font(font_2);
	draw_text(room_width/2, room_height/4 - 50, "DEFENDER");
	draw_set_font(font_1);
	draw_text(room_width/2, room_height/4, "Use UP/DOWN arrows to MOVE, 'Z' to SWITCH direction,");
	draw_text(room_width/2, room_height/4 + 20, "ALT to BOOST, and CTRL to FIRE missles");
	draw_text(room_width/2, room_height/2 - 30, "PROTECT humans from capture, and CATCH them when they fall.");
	draw_text(room_width/2, room_height/2 - 10, "GAME OVER if all humans die");
	
	
	draw_text(room_width/2, room_height/2 + 120, "press 1 to start");
}

if room == game{
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	draw_set_color(c_yellow);
	draw_set_font(font_1);
	draw_text(20, 25, global.points);
	for(i=0;i<global.player_lives;i++){
		draw_sprite_ext(spr_player,0,20 + i*25, 10, 0.8,0.8,0,c_white,1);
	}
}

if room == end_screen{
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(font_2);
	draw_set_color(c_aqua);
	draw_text(room_width/2, room_height/2 - 30, "THE ALIENS OVERTOOK YOU");
	draw_set_font(font_1);
	draw_text(room_width/2, room_height/2, "score: " + string(global.points));
	draw_text(room_width/2, room_height/2 + 100, "press 1 to restart");
}

if room == human_end_screen{
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_color(c_aqua);
	draw_set_font(font_2);
	draw_text(room_width/2, room_height/2 - 30, "ALL HUMANS WERE DESTROYED");
	draw_set_font(font_1);
	draw_text(room_width/2, room_height/2, "score: " + string(global.points));
	draw_text(room_width/2, room_height/2 + 100, "press 1 to restart");
}