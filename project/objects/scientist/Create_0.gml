batteries = 3

stage = -1

hp = 12

shields = true

timer = -1

damagedTimer = -1
imDamaged = false
function damaged() {
	if damagedTimer > -1 damagedTimer--
	
	if damagedTimer == 0 {
		imDamaged = false
		if object_index == enemy {
			alive = false
			sprite_index = s_enemy_death
			bloodPuddleAngle = irandom_range(-15,15)
		}
		
		if object_index == crate {
			if player.hand.ID == id {
				player.drop()	
			}
			
			if ammoCrate instance_create_layer(x,y-16,"Instances",ammunition)
			instance_destroy()
		}
	}
}

function doDamage(damage) {
	hp -= damage
	imDamaged = true
	damagedTimer = 5
}

blowingUp = false
blowingUpTimer = 8
blowingUpCameraTimer = 240
blowingUpEndGame = -1

room1Door = -1
room2Door = -1
room3Door = -1

ammoSpawned = false

//	Camera focus
cameraControl = false
cameraX = -1
cameraY = -1
cameraDuration = 120
cameraTime = time.stream
cameraDelay = -1

function cameraSet(x, y) {
	cameraTime = time.stream
	cameraControl = true
	cameraX = x
	cameraY = y
}

cameraSet(x,y)
cameraDelay = 90