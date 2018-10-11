//maximum speed of the player
global.max_spd = 9;

//up and down speed
y_spd = 5;
//collisions variable
global.player_hit = false;

//Acceleration & Velocity values
//when the player moves there is a slow build-up to the max speed
global.accel = 0.25;
global.deaccel = -0.25;
global.x_velocity = 0;


//player direction value for movement and projectile firing
//1 for right, -1 for left
global.player_dir = 1;
