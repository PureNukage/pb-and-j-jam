event_inherited()

aggro = false
zone = -1

mask_index = s_demon

goal = {
	x: -1,
	y: -1,
	ID: -1,
}

waitTimer = -1

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
	
function idlewalk() {
	var distance = 200
	var X = irandom_range(x-distance,x+distance)
	var Y = irandom_range(y-distance,y+distance)
			
	X = clamp(X, 0, room_width)
	Y = clamp(Y, 0, room_height)
					
	if zone > -1 {
		X = irandom_range(zone.x, zone.x+(sprite_get_width(zone.sprite_index)*abs(zone.image_xscale)))
		Y = irandom_range(zone.y, zone.y+(sprite_get_height(zone.sprite_index)*abs(zone.image_yscale)))
	}
				
	//	I can pathfind, lets start walking
	if pathfind(grid.mpGrid, path, x,y, X,Y) {
		goal.x = X
		goal.y = Y
		xGoto = path_get_point_x(path,pos)
		yGoto = path_get_point_y(path,pos)
		state = state.walk
	}	
}