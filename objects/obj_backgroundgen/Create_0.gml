global.left_edge = -room_width;
global.right_edge = room_width * 2;

for(i=global.left_edge - 32; i<global.right_edge + 32; i += 64){
	instance_create_depth(i, room_height - 20, 3, obj_mountain);
}