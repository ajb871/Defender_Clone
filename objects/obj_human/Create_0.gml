//On creation: generate random X position
x = random_range(global.left_edge,global.right_edge);

//Place along floor
y = global.ground;


//Is this human currently being captured? Are they falling? are they being carried?
//These variables are triggered in obj_enemy_lander.
being_captured = false;
carried = false;
falling = false;
fall_height = 0;

grav = 2;