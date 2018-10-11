//Every 30 seconds produce another lander
if global.game_time%5 == 0 {
	instance_create_depth(x,y,0,obj_enemy_lander);
}