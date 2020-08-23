//	Layer depth
var room1ID = layer_get_id("Tiles_room1")
var room2ID = layer_get_id("Tiles_room2")
var room3ID = layer_get_id("Tiles_room3")
layer_depth(room1ID, -2000)
layer_depth(room2ID, -2000)
layer_depth(room3ID, -2000)

batteries = 0
with battery {
	if alive other.batteries++
}

//	Destroyed the first battery!
if batteries == 2 and stage == 0 {
	stage++
	
	var layerID = layer_get_id("Tiles_room1")
	layer_set_visible(layerID, false)
	
	cameraSet(351, 317)
	
	room1Door.open()
	
	//	Spawn enemies
	var Enemy = instance_create_layer(350, 142, "Instances", enemy)
	Enemy.zone = zone1
	var Enemy = instance_create_layer(350, 150, "Instances", enemy)
	Enemy.zone = zone1
	var Enemy = instance_create_layer(350, 132, "Instances", enemy)
	Enemy.zone = zone1
	var Enemy = instance_create_layer(350, 122, "Instances", enemy)
	Enemy.zone = zone1
}

//	Destroyed the second battery!
if batteries == 1 and stage == 1 {
	stage++
	
	var layerID = layer_get_id("Tiles_room2")
	layer_set_visible(layerID, false)
	
	cameraSet(1056, 317)
	
	room2Door.open()
	
	//	Spawn enemies
	var Enemy = instance_create_layer(1057, 101, "Instances", enemy)
	Enemy.zone = zone2
	var Enemy = instance_create_layer(1057, 111, "Instances", enemy)
	Enemy.zone = zone2
	var Enemy = instance_create_layer(1057, 121, "Instances", enemy)
	Enemy.zone = zone2
	var Enemy = instance_create_layer(1057, 91, "Instances", enemy)
	Enemy.zone = zone2
}

//	Destroyed the third battery!
if batteries == 0 and stage == 2 {
	stage++
	
	cameraSet(x, y)
} 
	
//	Blowing up!!
else if batteries == 0 and stage == 3 {
	blowingUp = true
	blowingUpCameraTimer--
	
	app.screenShake(10)
	
	if blowingUpCameraTimer == 0 {
		cameraSet(1247, 294)
		room3Door.open()
		layer_set_visible(room3ID, false)
	}
}

if cameraControl {
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