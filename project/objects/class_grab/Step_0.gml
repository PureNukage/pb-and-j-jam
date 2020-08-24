if grabbed {	
	var _Direction = point_direction(x,y, mouse_x,mouse_y+32)
	var Force = point_distance(x,y, mouse_x,mouse_y+32) * 0.09
	
	xx = lengthdir_x(Force, _Direction)
	yy = lengthdir_y(Force, _Direction)
	
	z = y - height
} else {
	if !onGround applyGravity()
	else z = y - height
	if force > 0 {
		applyForce(Direction, force)
		force--
	}
}

applyMovement()

depth = -y