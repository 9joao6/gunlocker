#define init 
global.sprToaster = sprite_add_weapon("../Sprites/FlameShell/Toaster.png",5,2);

#define weapon_name
return "TOASTER"; // Name

#define weapon_type
return 1; // Bullet Wep

#define weapon_cost
return 1; // 1 Ammo

#define weapon_area
return 6; // L0 3-1+

#define weapon_load
return 2; // 0.07 Seconds

#define weapon_auto
return 1; // Automatic

#define weapon_swap
return sndSwapMachinegun; // Swap Sound

#define weapon_fire
 // Sound:
sound_play(sndIncinerator);
sound_play(sndPopgun);

weapon_post(3, -5, 4);

with instance_create(x,y,Shell){ // Empty Bullet Casing
	motion_add(other.gunangle + other.right*100 + random_range(-25,25),2+random(2))
}

with instance_create(x,y,FlameShell){ // Flame Shell
	motion_add(other.gunangle + (random_range(-4, 4) * other.accuracy),14+random(2));
	team = other.team;
	creator = other;
}

#define weapon_sprt
return global.sprToaster; // Wep Sprite

#define weapon_text
return "DON'T BURN YOURSELF"; // Loading Tip