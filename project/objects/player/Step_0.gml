if alive {
	hspd = input.keyRight - input.keyLeft
	vspd = input.keyDown - input.keyUp

	//	If applying movement
	if (hspd != 0 or vspd != 0) {
	
		//	Sprite
		if hand.ID == -1 {
			if hspd != 0 {
				sprite_index = s_player_side
				image_xscale = hspd
			} else if vspd > 0 {
				sprite_index = s_player_front	
			} else if vspd < 0 {
				sprite_index = s_player_back	
			}
		}
	
		var Direction = point_direction(0,0,hspd,vspd)
		var Force = 5
		xx = lengthdir_x(Force, Direction)
		yy = lengthdir_y(Force, Direction)
	
	} else {
	
	}

	applyMovement()
	
	if place_meeting(x,y,goo) {
		die()		
	}

	aim()

	//grab()

	if input.keyPlaceSpawn placeSpawn(x,y)
	
}
//	Dead
else {
	sprite_index = s_skull
}