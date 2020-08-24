event_inherited() 

if !instance_exists(app) instance_create_layer(0,0,"Instances",app)

canControl = true
hspd = 0
vspd = 0
xx = 0
yy = 0

ammo = app.ammo
mag = app.mag

gooDelay = true

spawning = false

spawn = {
	x: -1,
	y: -1,
	
	listCrates: ds_list_create(),
	listEnemies: ds_list_create(),
	listBarrels: ds_list_create(),
	listAmmo: ds_list_create()
	
}

function placeSpawn(x, y) {
	spawn.x = x
	spawn.y = y
	debug.log("Placing spawn at: "+string(x) + "," + string(y))
	
	spawn.ammo = player.ammo
	spawn.mag = player.mag
	
	if instance_exists(crate) {
		var number = instance_number(crate)
		ds_list_clear(spawn.listCrates)
		
		for(var i=0;i<number;i++) {
			spawn.listCrates[| i] = {
				
			}
		}
		
		var i = 0
		with crate {
			var Object = player.spawn.listCrates[| i]
			Object.x = id.x
			Object.y = id.y
			Object.ID = id
			Object.alive = alive
			Object.visible = visible
			Object.hp = hp
			
			player.spawn.listCrates[| i] = Object
			
			i++
		}	
	}
	
	if instance_exists(barrel) {
		var number = instance_number(barrel)
		ds_list_clear(spawn.listBarrels)
		
		for(var i=0;i<number;i++) {
			spawn.listBarrels[| i] = {
				
			}
		}
		
		var i = 0
		with barrel {
			var Object = player.spawn.listBarrels[| i]
			Object.x = id.x
			Object.y = id.y
			Object.ID = id
			Object.knocked = knocked
			Object.alreadyUsed = alreadyUsed
			Object.bloodPuddleSize = bloodPuddleSize
			Object.bloodPuddleAngle = bloodPuddleAngle
			Object.bloodPuddleFinished = bloodPuddleFinished
			Object.sprite_index = sprite_index
			Object.image_index = image_index
			
			
			player.spawn.listBarrels[| i] = Object		
			i++
		}			
	}
		
	if instance_exists(enemy) {
		var number = instance_number(enemy)
		ds_list_clear(spawn.listEnemies)
		
		for(var i=0;i<number;i++) {
			spawn.listEnemies[| i] = {
				
			}
		}
		
		var i = 0
		with enemy {
			var Object = player.spawn.listEnemies[| i]
			Object.x = id.x
			Object.y = id.y
			Object.ID = id
			Object.aggro = aggro
			Object.alive = alive
			
			Object.bloodPuddleSize = bloodPuddleSize
			Object.bloodPuddleAngle  = bloodPuddleAngle
			
			Object.sprite_index = sprite_index
			Object.image_index = image_index
			
			
			player.spawn.listEnemies[| i] = Object		
			i++
		}	
	}
		
	if instance_exists(ammunition) {
		var number = instance_number(ammunition)
		for(var i=0;i<number;i++) {
			spawn.listAmmo[| i] = {
					
			}
		}
		
		var i = 0
		with ammunition {
			var Object = player.spawn.listAmmo[| i]
			Object.x = id.x
			Object.y = id.y
			Object.ID = id
			
			player.spawn.listAmmo[| i] = Object
			
			i++	
		}
	}
		
	if room = Room4 {
		spawn.stage = scientist.stage
		spawn.hp = scientist.hp
		spawn.shields = scientist.shields
		spawn.timer = scientist.timer
		spawn.blowingUp = scientist.blowingUp
		spawn.blowingUpTimer = scientist.blowingUpTimer
		spawn.blowingUpCameraTimer =scientist.blowingUpCameraTimer
		spawn.blowingUpEndGame = scientist.blowingUpEndGame
		spawn.ammoSpawned = scientist.ammoSpawned
		spawn.cameraControl = scientist.cameraControl
		spawn.cameraX = scientist.cameraX
		spawn.cameraY = scientist.cameraY
		spawn.cameraDuration = scientist.cameraDuration
		spawn.cameraTime = scientist.cameraTime
		spawn.cameraDelay = scientist.cameraDelay
		
	}
}

function spawnRespawn() {
	
	player.ammo = spawn.ammo
	player.mag = spawn.mag
	
	if instance_exists(crate) {
		for(var i=0;i<ds_list_size(spawn.listCrates);i++) {
			var Object = spawn.listCrates[| i]
			var Crate = Object.ID
			
			with Crate {
				if grabbed {
					player.drop()	
				}
				x = Object.x
				y = Object.y
				alive = Object.alive
				visible = Object.visible
				hp = Object.hp
			}
			
		}
	}
		
	if instance_exists(barrel) {
		for(var i=0;i<ds_list_size(spawn.listBarrels);i++) {
			var Object = spawn.listBarrels[| i]
			var Barrel = Object.ID
			
			with Barrel {
				if grabbed {
					player.drop()	
				}
				x = Object.x
				y = Object.y
				
				//	Cleanup old goo puddle
				if knocked and !Object.knocked {
					instance_destroy(myGoo)
					myGoo = -1
				}
				
				knocked = Object.knocked
				alreadyUsed = Object.alreadyUsed
				bloodPuddleSize = Object.bloodPuddleSize
				bloodPuddleAngle = Object.bloodPuddleAngle
				bloodPuddleFinished = Object.bloodPuddleFinished
				sprite_index = Object.sprite_index
				image_index = Object.image_index	
			}
			
		}	
	}
		
	if room != Room4 if instance_exists(enemy) {
		for(var i=0;i<ds_list_size(spawn.listEnemies);i++) {
			var Object = spawn.listEnemies[| i]
			var Enemy = Object.ID
			
			with Enemy {
				x = Object.x
				y = Object.y
				alive = Object.alive
				aggro = Object.aggro
			
				bloodPuddleSize = Object.bloodPuddleSize
				bloodPuddleAngle  = Object.bloodPuddleAngle
			
				sprite_index = Object.sprite_index
				image_index = Object.image_index
				
			}
			
		}	
	}
		
	if instance_exists(bullet) with bullet instance_destroy()
	
	if !ds_list_empty(spawn.listAmmo) {
		for(var i=0;i<ds_list_size(spawn.listAmmo);i++) {
			var Object = spawn.listAmmo[| i]
			
			if instance_exists(Object.ID) {
				with Object.ID {
					x = Object.x
					y = Object.y
				}
			} else {
				var ID = instance_create_layer(Object.x,Object.y,"Instances",ammunition)
				spawn.listAmmo[| i].ID = ID
			}
		}
	}
		
	if room = Room4 {
		scientist.stage = spawn.stage
		scientist.hp = spawn.hp
		scientist.shields = spawn.shields
		scientist.timer = spawn.timer
		scientist.blowingUp = spawn.blowingUp
		scientist.blowingUpTimer = spawn.blowingUpTimer
		scientist.blowingUpCameraTimer = spawn.blowingUpCameraTimer
		scientist.blowingUpEndGame = spawn.blowingUpEndGame
		scientist.ammoSpawned = spawn.ammoSpawned
		scientist.cameraControl = spawn.cameraControl
		scientist.cameraX = spawn.cameraX
		scientist.cameraY = spawn.cameraY
		scientist.cameraDuration = spawn.cameraDuration
		scientist.cameraTime = spawn.cameraTime
		scientist.cameraDelay = spawn.cameraDelay
		
		var room1ID = layer_get_id("Tiles_room1")
		var room2ID = layer_get_id("Tiles_room2")
		var room3ID = layer_get_id("Tiles_room3")
		var watchID = layer_get_id("white")
		var backgroundID = layer_background_get_id(watchID)
		layer_background_alpha(backgroundID, 1)
		layer_set_visible(watchID, false)
		layer_set_visible(room1ID, true)
		layer_set_visible(room2ID, true)
		layer_set_visible(room3ID, true)
		
		with door close()
		
		with battery {
			alive = true
			sprite_index = s_wire
		}
		
		if instance_exists(enemy) with enemy instance_destroy()
	}
	
	
}

hand = {
	ID: -1,
}

function die() {	
	alive = false
	
	if hand.ID > -1 drop()
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