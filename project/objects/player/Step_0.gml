if gooDelay {
	placeSpawn(x,y)
	gooDelay = false
}

if alive {
	if canControl {
		hspd = input.keyRight - input.keyLeft
		vspd = input.keyDown - input.keyUp
	}

	//	If applying movement
	if (hspd != 0 or vspd != 0) {
	
		//	Sprite
		image_speed = 1
		if input.mouseRight image_speed = 0.5
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
		if input.mouseRight Force = 2
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
		sprite_index = s_player_goo_death
		die()		
	}
	
	//	I got shot!
	mask_index = s_player_hitbox
	if place_meeting(x,y,bullet) and !instance_place(x,y,bullet).killsEnemy {
		sprite_index = s_player_shot_death
		image_index = 0
		image_speed = 1
		die()
		
		sound.playSound(choose(snd_player_hit_1, snd_player_hit_2, snd_player_hit_3))
	}
	mask_index = s_demon

	if input.mouseRight {
		if hand.ID > -1 {
			drop()	
		}
		if alive aim()
	}

	if sprite_index != s_player_aim and alive grab()
	
	//	Reloading
	if input.keyReload reloading = true
	if reloading reload()

	if input.keyPlaceSpawn and room != Room4 {
		placeSpawn(x,y)
		sound.playSound(snd_squish)
	}
	
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
	if spawning {
		if animation_end {
			spawning = false
			alive = true
			sprite_index = s_player_front
		}
	}
	else if animation_end image_index = image_number-1
}

depth = -y