event_inherited() 

if !instance_exists(app) instance_create_layer(0,0,"Instances",app)

canControl = true
hspd = 0
vspd = 0
xx = 0
yy = 0

ammo = app.ammo
mag = app.mag

spawn = {
	x: -1,
	y: -1,
}

hand = {
	ID: -1,
}

function die() {
	sprite_index = s_skull	
	alive = false
}

function placeSpawn(x, y) {
	spawn.x = x
	spawn.y = y
	debug.log("Placing spawn at: "+string(x) + "," + string(y))
}

reloading = false
reloadingTimer = -1
function reload() {
	
	var maxMag = 8
	var reloadSpeed = 15
	if reloadingTimer == -1 {
		reloadingTimer = reloadSpeed	
	} else {
		if reloadingTimer > -1 {
			reloadingTimer--
			
			if reloadingTimer == 0 {
				if ammo > 0 and mag < maxMag {
					ammo--
					mag++
					reloadingTimer = reloadSpeed
					
					sound.playSound(snd_reload)
				} else {
					reloading = false	
					reloadingTimer = -1
					
					sound.playSound(snd_reload_done)
				}	
			}
		}
	}
}

function aim() {
	
	var mouseDirection = point_direction(x,y, mouse_x,mouse_y)
	
	var Direction = round(mouseDirection/45) * 45 % 360
	
	if input.mouseLeftPress {
		
		if mag > 0 {
		
			#region Bullet should come out of the barrel
				var bulletOffsetX = -1
				var bulletOffsetY = -1
				switch(Direction) {
					//	Right
					case 0:
						bulletOffsetX = 29
						bulletOffsetY = -23
					break
					//	Top-right
					case 45:
						bulletOffsetX = 22
						bulletOffsetY = -40
					break
					//	Top
					case 90:
						bulletOffsetX = 3
						bulletOffsetY = -43
					break
					//	Top-left
					case 135:
						bulletOffsetX = -22
						bulletOffsetY = -40
					break
					//	Left
					case 180:
						bulletOffsetX = -29
						bulletOffsetY = -23
					break
					//	Bottom-left
					case 225:
						bulletOffsetX = -15
						bulletOffsetY = -12
					break
					//	Bottom
					case 270:
						bulletOffsetX = -2
						bulletOffsetY = -10
					break
					//	Bottom-right
					case 315:
						bulletOffsetX = 15
						bulletOffsetY = -12
					break
				}
			#endregion
		
			var Bullet = instance_create_layer(x+bulletOffsetX,y+bulletOffsetY,"Instances",bullet)
			Bullet.direction = Direction
			Bullet.Force = 12
			Bullet.image_angle = Direction
		
			sound.playSound(choose(snd_gunfire_1, snd_gunfire_2, snd_gunfire_3))
			
			player.mag--
			
			if reloading {
				reloading = false
				reloadingTimer = -1
			}
		}
		//	Out of ammo!
		else {
			sound.playSound(snd_out_of_ammo)
		}
	}
	
	////	Determine aiming sprite
	//	Top-right
	if Direction == 45 {
		sprite_index = s_player_gun_walk_back_right
		image_xscale = 1
	} 
	//	Up
	else if Direction == 90 {
		sprite_index = s_player_gun_walk_back
		image_xscale = 1
	}
	//	Top-left
	else if Direction == 135 {
		sprite_index = s_player_gun_walk_back_right
		image_xscale = -1
	}
	//	Left
	else if Direction == 180 {
		sprite_index = s_player_gun_walk_side
		image_xscale = -1
	}
	//	Bottom-left
	else if Direction == 225 {
		sprite_index = s_player_gun_walk_front_right
		image_xscale = -1
	}
	//	Bottom
	else if Direction == 270 {
		sprite_index = s_player_gun_walk_front
		image_xscale = 1
	}
	//	Bottom-right
	else if Direction == 315 {
		sprite_index = s_player_gun_walk_front_right
		image_xscale = 1
	}
	//	Right
	else if Direction == 0 {
		sprite_index = s_player_gun_walk_side
		image_xscale = 1
	}
	
}
	
function grab() {
	
	//	Not holding anything
	if hand.ID == -1 {
		if instance_position(mouse_x,mouse_y,all) {
			var ID = instance_position(mouse_x,mouse_y,all)
		
			if object_get_parent(ID.object_index) == class_grab {
				if ID.object_index == crate or ID.object_index == barrel and !ID.knocked {
					if input.mouseLeftPress {
						hand.ID = ID
						ID.grabbed = true
					}
				}
			}
		}
		
	} 
	//	Holding something
	else {
		
		var distanceFromPlayer = point_distance(x,y, hand.ID.x,hand.ID.y)
		
		if input.mouseLeftRelease or distanceFromPlayer > maxDistanceFromPlayer {		
			drop()
		}
		
		hand.ID.pickedUp(15)
		
		//	Decide direction for the player to face
		var mouseDirection = point_direction(x,y, mouse_x,mouse_y)
	
		var Direction = round(mouseDirection/45) * 45 % 360
		
		if Direction > 45 and Direction < 135 {
			sprite_index = s_player_goo_walk_back
		} else if Direction > 135 and Direction < 225 {
			sprite_index = s_player_goo_walk_side
			image_xscale = -1
		} else if Direction > 225 and Direction < 315 { 
			sprite_index = s_player_goo_walk_front	
		} else if Direction > 315 or Direction < 45 {
			sprite_index = s_player_goo_walk_side
			image_xscale = 1
		}
	}
	
}
	
function drop() {
	if hand.ID > -1 {
		//	Apply force to object
		if (hand.ID.x != mouse_x or hand.ID.y != mouse_y) {
			var Direction = point_direction(hand.ID.x,hand.ID.y, mouse_x,mouse_y)
			var maxDistance = 500
			var maxForce = 50
			if point_distance(hand.ID.x,hand.ID.y, mouse_x,mouse_y) > maxDistance {
				var Force = maxForce	
			} else {
				var Force = (point_distance(hand.ID.x,hand.ID.y, mouse_x,mouse_y) / maxDistance) * maxForce	
			}
			hand.ID.setForce(Direction, Force)
		}
			
		hand.ID.beingPickedUp = false
		hand.ID.finishedBeingPickedUp = false
		hand.ID.grabbed = false
		hand.ID = -1	
	}
}
	
mask_index = s_demon
	
placeSpawn(x,y)