xx = 0
yy = 0
hspd = 0
vspd = 0
onGround = true
z = y
height = 0
thrust = 0
force = 0

path = path_add()
pos = 0
xGoto = -1
yGoto = -1

force = 0
Direction = 0

hp = 10

function applyMovement() {
	//	Apply movement
	for(var W=0;W<abs(xx);W++) {
		if !place_meeting(x + sign(xx), y, collision) x += sign(xx)
	}

	for(var H=0;H<abs(yy);H++) {
		if !place_meeting(x, y + sign(yy), collision) y += sign(yy)	
	}

	xx = 0
	yy = 0	
}
	
function applyGravity() {
	
		thrust -= 1 
		
		z -= thrust
		
		if z >= y {
			z = y
			height = 0
			onGround = true
			thrust = 0
		}
	
}
	
function setForce(Direction_, Force) {
	force = Force
	Direction = Direction_
}

function applyForce(Direction, Force) {
	
	xx = lengthdir_x(Force, Direction)
	yy = lengthdir_y(Force, Direction)
	
}
	
damagedTimer = -1
imDamaged = false
function damaged() {
	if damagedTimer > -1 damagedTimer--
	
	if damagedTimer == 0 {
		imDamaged = false	
	}
}

function doDamage(damage) {
	hp -= damage
	imDamaged = true
	damagedTimer = 15
}

beingPickedUp = false
finishedBeingPickedUp = false
function pickedUp(Height) {
	
	if !beingPickedUp {
		if finishedBeingPickedUp {
			thrust = 0
		} else {
			onGround = false
			beingPickedUp = true
		}
	} else {
	
		thrust += 0.5
		z -= thrust
	
		if z <= y-Height {
			if z > y-Height z = y-Height
			height = Height
			beingPickedUp = false
			finishedBeingPickedUp = true
		}
	}
	
}

shadow = {
	x : -1,
	y : -1
}