#define init 
sprPopPistol = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAAA4AAAAHCAYAAAA4R3wZAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH4AsUFTMbFtiNvAAAAGlJREFUGNNjZMAC7CWFGRTEhBkuc0kw6H57ARe/zCXBcO74IQYGBgYGRiz6/jMQBows6BqMLO0YpGTlGRRU1DFUP7hzk2HLqsUoNv4nxnnINqJoZGBgYDj4/C3cn0h8DC8xYvEXPjHKAQAR+yAJRSbcxwAAAABJRU5ErkJggg==",0,1);

#define weapon_name
return "POP PISTOL"; // Name

#define weapon_type
return 1; // Bullet Wep

#define weapon_cost
return 1; // 1 Ammo

#define weapon_area
return 4; // L0 1-3+

#define weapon_load
return 5; // 0.17 Seconds

#define weapon_swap
return sndSwapPistol; // Swap Sound

#define weapon_fire
repeat(2) if instance_exists(self){
	sound_play(sndPopgun); // Sound
	weapon_post(3, -4, 4);
	
	with instance_create(x,y,Shell){ // Empty Bullet Casings
		motion_add(other.gunangle + other.right*100 + random_range(-25,25),2+random(2))
	}
	with instance_create(x,y,Bullet2){ // Shells
		motion_add(other.gunangle + (random_range(-4, 4) * other.accuracy),15 + random(1));
		team = other.team;
		creator = other;
	}
	wait 2;
}

#define weapon_sprt
return sprPopPistol; // Wep Sprite

#define weapon_text
return "I GUESS IT WORKS"; // Loading Tip