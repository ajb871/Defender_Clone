/*x = random_range(global.left_edge,global.right_edge);
y = random_range(40,160);*/

x = 150;
y = 180;

//Starting speed of lander
lander_yspd = random_range(0.5,2);
lander_xspd = random_range(0,1.5);

//Randomize starting directions (up/down left/right)
lander_ydir = choose(-1,1);
lander_xdir = choose(-1,1);

//Know when a human has been "grabbed" by a lander
capturing = false;

//Alternate between seeking humans "roaming" to lower difficulty
roaming = true;
seeking = false;


//Timer to control projectile firing
fire_ready = false;