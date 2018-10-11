//starting number of landers
landers_num = 1;
for(var i=0;i<landers_num;i++){
	instance_create_depth(x,y,1,obj_enemy_lander);
	show_debug_message("lander out");
}