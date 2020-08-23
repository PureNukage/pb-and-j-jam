if alive {
	hspd = input.keyRight - input.keyLeft
	vspd = input.keyDown - input.keyUp

	//	If applying movement
	if (hspd != 0 or vspd != 0) {
	
		//	Sprite
		image_speed = 1
		if hand.ID == -1 {
			if hspd != 0 {
				sprite_index = s_player_walk_side
				image_xscale = hspd
			} else if vspd > 0 {
				sprite_index = s_player_walk_front
			} else if vspd < 0 {
				sprite_index = s_player_walk_back
			}
		}
	
		var Direction = point_direction(0,0,hspd,vspd)
		var Force = 3
		if hand.ID > -1 Force = 2
		xx = lengthdir_x(Force, Direction)
		yy = lengthdir_y(Force, Direction)
	
	} else {
		if sprite_index == s_player_aim sprite_index = s_player_walk_front
		image_speed = 0
		image_index = 0
	}

	applyMovement()
	
	//	Touching goo
	if place_meeting(x,y,goo) {
		die()		
	}
	
	//	I got shot!
	if place_meeting(x,y,bullet) and !instance_place(x,y,bullet).killsEnemy {
		die()		
	}

	if input.mouseRight {
		if hand.ID > -1 {
			drop()	
		}
		aim()
	}

	if sprite_index != s_player_aim grab()
	
	//	Reloading
	if input.keyReload reloading = true
	if reloading reload()

	if input.keyPlaceSpawn placeSpawn(x,y)
	
	if hand.ID == -1 and !instance_position(mouse_x,mouse_y,all) {
		cursor_sprite = s_cursor_aim	
	} else if hand.ID > -1 {
		cursor_sprite = s_cursor_hand_closed
	} else if hand.ID == -1 and instance_position(mouse_x,mouse_y,all) and object_get_parent(instance_position(mouse_x,mouse_y,all).object_index) == class_grab {
		cursor_sprite = s_cursor_hand_open
	}
	
}
//	Dead
else {
	sprite_index = s_skull
}

depth = -y