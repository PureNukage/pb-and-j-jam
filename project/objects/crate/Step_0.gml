if grabbed {
	x = lerp(x, mouse_x, 0.09)
	y = lerp(y, mouse_y, 0.09)
	
	z = y - height
	//y = z + height
} else {
	if !onGround applyGravity()
	if force > 0 {
		applyForce(Direction, force)
		force--
	}
}

applyMovement()