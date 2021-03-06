#define init
global.sprDiscCannon = sprite_add_weapon("../Sprites/Disc/DiscCannon.png", 5, 5);
global.sprBigDisc = sprite_add("../Sprites/Projectiles/Disc/DiscBig.png", 2, 7, 7);
global.sprBigDiscTrail = sprite_add("../Sprites/Projectiles/Disc/DiscTrailBig.png", 3, 7, 7);

#define weapon_name
return "DISC CANNON"; // Name 

#define weapon_type
return 3; // Bolt Wep

#define weapon_cost
return 6; // 6 Ammo

#define weapon_area
return 6; // L0 3-2+

#define weapon_load
return 24; // 0.80 Seconds

#define weapon_sprt
return global.sprDiscCannon; // Wep Sprite

#define weapon_swap
return sndSwapBow; // Swap Sound

#define weapon_text
return "I WOULD SAY I'M SORRY#BUT THAT WOULD BE A LIE"; // Loading Tip

#define weapon_fire
 // Sound:
sound_play(sndSuperDiscGun);

with instance_create(x+lengthdir_x(12, gunangle), y+lengthdir_y(12, gunangle), CustomProjectile) {
	motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index]),4) // Set in motion
	typ = 1 // Destructable
	sprite_index = global.sprBigDisc // Set sprite
	mask_index = sprite_index // Set mask
	image_angle = direction // Set angle
	team = other.team // Set team
	creator = other // Set creator
	name = "bigdisc" // Set name
	
	dist = 0 // Distance for disc
	
	on_hit = bigDiscHit // Set on hit
	on_wall = bigDiscWall // Set on wall
	on_step = bigDiscStep // Set on Step
	on_destroy = bigDiscDead // Set on Destroy
}

wkick = 10

#define bigDiscHit
if other.team != team
{
	with other
	{
		if sprite_index != spr_hurt
		{
			sound_play(snd_hurt)
			my_health -= 12
			sprite_index = spr_hurt
			image_index = 0
			motion_add(other.direction,4)
			view_shake_at(x, y, 12);
		}
	}
}

#define bigDiscWall
move_bounce_solid(true)

if dist > 100
{
	instance_create(x,y,DiscDisappear)
	instance_destroy()
}
else
{
	sound_play(sndDiscBounce)
	with instance_create(x,y,DiscBounce)
	image_angle = other.image_angle
}

#define bigDiscStep
with instance_create(x, y, DiscTrail) {
	sprite_index = global.sprBigDiscTrail
}

dist += 1

if instance_exists(Player) {
	if point_distance(x,y,Player.x,Player.y) > 24
	team = -1
}

#define bigDiscDead
dir = image_angle

repeat(8) {
	with instance_create(x,y,Disc)
	{
		motion_add(other.dir-8+random(16),5)
		image_angle = direction
		team = other.team
	}
	dir += 360/8
}

