#define init
global.sprHeavyAutoBullgun = sprite_add_weapon("../Sprites/HeavyBullet/HeavyAutoBullgun.png", 4, 3);

#define weapon_name
return "HEAVY AUTO BULLGUN"; // Name

#define weapon_type
return 1; // Bullet Wep

#define weapon_cost
return 16; // 16 Ammo

#define weapon_load
return 9; // 0.30 Seconds

#define weapon_auto
return 1; // Automatic

#define weapon_area
return 12; // L0 6-1+

#define weapon_swap
return sndSwapShotgun; // Swap sound

#define weapon_fire
 // Sound:
sound_play(sndSlugger);
sound_play(sndHeavyMachinegun);

weapon_post(7, -20, 15);


repeat(8) with instance_create(x,y,Shell){ // Empty Heavy Bullet Casings
	motion_add(other.gunangle + other.right*100 + random_range(-40,40),2+random(2))
	sprite_index = sprHeavyShell;
}
repeat(7) with instance_create(x, y, HeavyBullet){ // Heavy Bullets
	motion_add(other.gunangle + (random_range(-22, 22) * other.accuracy), 14 + random(2));
	image_angle = direction;
	team = other.team;
	creator = other;
}


#define weapon_sprt
return global.sprHeavyAutoBullgun; // Wep Sprite