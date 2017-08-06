#define init
	global.sprGrenadeMinigun = sprite_add_weapon("../Sprites/MiniGrenade/GrenadeMinigun.png", 3, 4);

#define weapon_name
	return "GRENADE MINIGUN"; // Weapon Name 

#define weapon_type
	return 4; // Explosive Wep

#define weapon_cost
	return 1; // 1 Ammo

#define weapon_area
	return 13; // L0 7-1+

#define weapon_load
	return 9; // 0.30 second

#define weapon_swap
	return sndSwapExplosive; // Shell Weapon Swap Sound

#define weapon_auto
	return 1; // Automatic

#define weapon_fire
	repeat(3) {
		if instance_exists(self) {
			sound_play(sndGrenadeRifle)
			weapon_post(8, -14, 5)
			with instance_create(x, y, MiniNade){
				motion_set(other.gunangle + random_range(-16, 16) * other.accuracy, 12+random(2));
				image_angle = direction;
				team = other.team; 
				creator = other; 
			}
			wait 3;
		}
	}




#define weapon_sprt
	return global.sprGrenadeMinigun; // Weapon Sprite