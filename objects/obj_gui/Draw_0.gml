if room == start_screen{
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_color(c_aqua);
	draw_text(room_width/2, room_height/2, "press 1 to start");
}

if room == game{
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	draw_set_color(c_yellow);
	draw_text(20, 25, global.points);
	for(i=0;i<global.player_lives;i++){
		draw_sprite_ext(spr_player,0,20 + i*25, 10, 0.8,0.8,0,c_white,1);
	}
}

if room == end_screen{
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_color(c_aqua);
	draw_text(room_width/2, room_height/2, "score: " + string(global.points));
	draw_text(room_width/2, room_height/2 + 30, "press 1 to restart");
}