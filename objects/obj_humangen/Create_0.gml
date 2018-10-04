//Create 10 humans at the start of each round
human_num = 10;
global.human_y = room_height - 10;

for(var i = 0; i < human_num; i ++){
	instance_create_depth(0,0,2,obj_human);
}
