#define init 
	global.sprMinibow = sprite_add_weapon("../Sprites/Bolt/Minibow.png", 7, 7);

#define weapon_name
	return "MINIBOW"; // Name

#define weapon_type
	return 3; // Bolt Wep

#define weapon_area
	return 16; // L0 7-3+

#define weapon_load
	return 3; // 0.10 Seconds

#define weapon_auto
	return 1; // Automatic

#define weapon_swap
	return sndSwapBow; // Swap Sound

#define weapon_fire
	sound_play(sndCrossbow);			// Sound
	weapon_post(8, -20, 8);				// Kick, Shift, Shake
	motion_add(gunangle + 180, 1.5);	// Knockback

	 // Innacurate Bolt:
	with instance_create(x,y,Bolt){
		motion_add(other.gunangle + (random_range(-12, 12) * other.accuracy), 24)
		image_angle = direction;
		hitid = [sprite_index, "BOLT"];
		team = other.team;
		creator = other;
	}

#define weapon_sprt
	return global.sprMinibow; // Wep Sprite

#define weapon_text
	return "10 BOLTS PER SECOND"; // Loading Tip