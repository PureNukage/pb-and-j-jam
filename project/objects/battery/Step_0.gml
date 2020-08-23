if place_meeting(x,y, barrel) and instance_place(x,y, barrel).knocked {
	alive = false	
}

if !alive {
	sprite_index = s_wire_destroyed
}