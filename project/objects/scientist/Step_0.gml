//	Layer depth
var room1ID = layer_get_id("Tiles_room1")
var room2ID = layer_get_id("Tiles_room2")
var room3ID = layer_get_id("Tiles_room3")
layer_depth(room1ID, -2000)
layer_depth(room2ID, -2000)
layer_depth(room3ID, -2000)

if place_meeting(x,y,bullet) and !imDamaged and (stage == 2 or stage == 8 or stage == 14) {
	doDamage(1)
	instance_destroy(instance_place(x,y,bullet)) 
	
	sound.playSound(choose(snd_enemy_hit_1, snd_enemy_hit_2, snd_enemy_hit_3))
	
	sprite_index = s_scientist_hit
}

if imDamaged damaged()

if shields {
	if !audio_is_playing(snd_shield1) sound.playSound(snd_shield1)
} else if audio_is_playing(snd_shield1) audio_stop_sound(snd_shield1)

var cameraDistance = 280
var enemyWaitTime = 60

batteries = 0
with battery {
	if alive other.batteries++
}

if stage == -1 and cameraDelay == -1 {
	stage++
	
	sound.playSound(snd_cackle3)
	
	sprite_index = s_scientist_laugh
}

if stage == 0 and !audio_is_playing(snd_cackle3) sprite_index = s_scientist_idle

//	Destroyed the first battery!
if batteries == 2 and stage == 0 {
	stage++
	
	var layerID = layer_get_id("Tiles_room1")
	layer_set_visible(layerID, false)
	
	cameraSet(x, y)
	
	cameraDelay = 90

}
	
//	The shield is down!
if batteries == 2 and stage == 1 and cameraDelay == -1 {
	stage++
	
	shields = false
	
}
	
//	Set the camera if the player gets close
if stage == 2 and point_distance(x,y, player.x,player.y) < cameraDistance {
	if app.cameraOnPlayer {
		app.cameraOnPlayer = false
		cameraSet(x,y)
	}
}
else if !app.cameraOnPlayer {
	app.cameraOnPlayer = true	
}

//	I've been shot 4 times
if batteries == 2 and stage == 2 and hp <= 8 {
	stage++
	
	timer = 90
	
	shields = true
	
	cameraSet(x,y)
	
	sound.playSound(snd_angry1)
	
	sprite_index = s_scientist_laugh
}

//	Angry yell
if stage == 3 and timer == -1 {
	stage++
}

//	Opening door
if batteries == 2 and stage == 4 {
	stage++
	
	cameraSet(351, 317)
	cameraDelay = 90
}

//	Spawn enemies
if batteries == 2 and stage == 5 and cameraDelay == -1 {
	stage++
	
	room1Door.open()
	
	sound.playSound(snd_cackle1)
	
	sprite_index = s_scientist_laugh
	
	//	Spawn enemies
	var Enemy = instance_create_layer(350, 142, "Instances", enemy)
	Enemy.zone = zone1
	Enemy.waitTimer = enemyWaitTime
	var Enemy = instance_create_layer(350, 150, "Instances", enemy)
	Enemy.zone = zone1
	Enemy.waitTimer = enemyWaitTime
	var Enemy = instance_create_layer(350, 132, "Instances", enemy)
	Enemy.zone = zone1
	Enemy.waitTimer = enemyWaitTime
	var Enemy = instance_create_layer(350, 122, "Instances", enemy)
	Enemy.zone = zone1
	Enemy.waitTimer = enemyWaitTime
}
	
if stage == 6 and !audio_is_playing(snd_cackle1) sprite_index = s_scientist_idle

//	Destroyed the second battery!
if batteries == 1 and stage == 6 {
	stage++
	
	var layerID = layer_get_id("Tiles_room2")
	layer_set_visible(layerID, false)
	
	cameraSet(x, y)
	cameraDelay = 90
}
	
//	The shield is down!
if batteries == 1 and stage == 7 and cameraDelay == -1 {
	stage++
	
	shields = false
	
}
	
//	Set the camera if the player gets close
if stage == 8 and point_distance(x,y, player.x,player.y) < cameraDistance {
	if app.cameraOnPlayer {
		app.cameraOnPlayer = false
		cameraSet(x,y)
	}
}
else if !app.cameraOnPlayer {
	app.cameraOnPlayer = true	
}

//	I've been shot 4 times
if batteries == 1 and stage == 8 and hp <= 4 {
	stage++
	
	timer = 90
	
	shields = true
	
	cameraSet(x,y)
	
	sound.playSound(snd_angry2)
	
	sprite_index = s_scientist_laugh
}
	
//	Angry yell
if stage == 9 and timer == -1 {
	stage++
}
	
//	Turn on shield
if batteries == 1 and stage == 10 {
	stage++
	
	shields = true
	
	cameraSet(1056, 317)
	cameraDelay = 90
	
	sprite_index = s_scientist_idle
}
	
//	Opening room2 and spawning enemies
if batteries == 1 and stage == 11 and cameraDelay == -1 {
	stage++
	
	room2Door.open()
	
	sound.playSound(snd_cackle2)
	
	sprite_index = s_scientist_laugh
	
	//	Spawn enemies
	var Enemy = instance_create_layer(1057, 142, "Instances", enemy)
	Enemy.zone = zone2
	Enemy.waitTimer = enemyWaitTime
	var Enemy = instance_create_layer(1057, 135, "Instances", enemy)
	Enemy.zone = zone2
	Enemy.waitTimer = enemyWaitTime
	var Enemy = instance_create_layer(1057, 120, "Instances", enemy)
	Enemy.zone = zone2
	Enemy.waitTimer = enemyWaitTime
	var Enemy = instance_create_layer(1057, 108, "Instances", enemy)
	Enemy.zone = zone2	
	Enemy.waitTimer = enemyWaitTime
}
	
if stage == 12 and !audio_is_playing(snd_cackle2) sprite_index = s_scientist_idle

//	Destroyed the third battery!
if batteries == 0 and stage == 12 {
	stage++
	
	cameraSet(x, y)
	cameraDelay = 90
} 
	
//	The shield is down!
if batteries == 0 and stage == 13 and cameraDelay == -1 {
	stage++
	
	shields = false
	
}
	
//	Set the camera if the player gets close
if stage == 14 and point_distance(x,y, player.x,player.y) < cameraDistance {
	if app.cameraOnPlayer {
		app.cameraOnPlayer = false
		cameraSet(x,y)
	}
}
else if !app.cameraOnPlayer {
	app.cameraOnPlayer = true	
}
	
//	I've been shot 4 times
if batteries == 0 and stage == 14 and hp <= 0 {
	stage++
	
	cameraSet(x,y)
	
	sound.playSound(snd_angry1)
	
	sprite_index = s_scientist_laugh
}
	
//	Blowing up!!
else if batteries == 0 and stage == 15 {
	blowingUp = true
	blowingUpCameraTimer--
	
	sprite_index = s_scientist_laugh
	
	app.screenShake(10)
	
	if blowingUpCameraTimer == 0 {
		cameraSet(1247, 294)
		room3Door.open()
		layer_set_visible(room3ID, false)
		
		blowingUpEndGame = 600
	}
	
	if blowingUpEndGame > 0 {
		blowingUpEndGame--
		var layerID = layer_get_id("white")
		layer_set_visible(layerID, true)
		layer_depth(layerID,-2000)
		var backgroundLayerID = layer_background_get_id(layerID)
		var alpha = 1 - (blowingUpEndGame / 420)
		layer_background_alpha(backgroundLayerID, alpha)
		
		if blowingUpEndGame == 1 and !endgameZone.gameFinished {
			player.die()	
		}
	}
}


if cameraDelay > -1 {
	cameraDelay--
	cameraTime++	
}

if timer > -1 {
	timer--	
}

if cameraControl and cameraDelay == -1 {
	var timeDiff = time.stream - cameraTime
	if timeDiff < cameraDuration {
		app.cameraFocus(cameraX, cameraY)	
	} else {
		app.cameraOnPlayer = true
		cameraControl = false
		cameraX = -1
		cameraY = -1
	}
}
	
	
//	If the players out of ammo
if player.ammo <= 0 and player.mag <= 0 and !ammoSpawned and !instance_exists(ammunition) {
	var Ammo = instance_create_layer(702, 479, "Instances", ammunition)
	Ammo.neededAmmo = true
	ammoSpawned = true
	debug.log("Spawning ammo!")
}