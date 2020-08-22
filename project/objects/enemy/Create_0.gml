event_inherited()

goal = {
	x: -1,
	y: -1,
	ID: -1,
}

state = state.idle

bloodPuddleSize = -1
bloodPuddleAngle = -1
function bloodPuddle() {
	
	var maxSize = 1
	if bloodPuddleSize == -1 {
		bloodPuddleSize = 0
	}
	else if bloodPuddleSize < maxSize {
		bloodPuddleSize = approach(bloodPuddleSize, maxSize, 0.05)
	}
	
	draw_sprite_ext(s_enemy_blood, 0, x+(16*image_xscale), y+3, bloodPuddleSize, bloodPuddleSize, bloodPuddleAngle, c_white, 1)
}