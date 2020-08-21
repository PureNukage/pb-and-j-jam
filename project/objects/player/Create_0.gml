event_inherited()

hspd = 0
vspd = 0
xx = 0
yy = 0
alive = true

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

function aim() {
	
	var mouseDirection = point_direction(x,y, mouse_x,mouse_y)
	
	var Direction = round(mouseDirection/45) * 45 % 360
	
	if input.mouseLeftPress {
		var Bullet = instance_create_layer(x,y,"Instances",bullet)
		Bullet.direction = Direction
		Bullet.Force = 12
		Bullet.image_angle = Direction
	}
	
}
	
function grab() {
	
	//	Not holding anything
	if hand.ID == -1 {
		if instance_position(mouse_x,mouse_y,all) {
			var ID = instance_position(mouse_x,mouse_y,all)
		
			if ID.object_index == crate {
				if input.mouseRightPress {
					hand.ID = ID
					ID.grabbed = true
				}
			}
		}
		
	} 
	//	Holding something
	else {
		if input.mouseRightRelease {
			
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
		
		hand.ID.pickedUp(15)
		
		//	Decide direction for the player to face
		var mouseDirection = point_direction(x,y, mouse_x,mouse_y)
	
		var Direction = round(mouseDirection/45) * 45 % 360
		
		if Direction > 45 and Direction < 135 {
			sprite_index = s_player_back	
		} else if Direction > 135 and Direction < 225 {
			sprite_index = s_player_side
			image_xscale = -1
		} else if Direction > 225 and Direction < 315 { 
			sprite_index = s_player_front	
		} else if Direction > 315 or Direction < 45 {
			sprite_index = s_player_side
			image_xscale = 1
		}
	}
	
}
	
	
	
	
placeSpawn(x,y)