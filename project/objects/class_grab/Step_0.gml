if grabbed {
	x = lerp(x, mouse_x, 0.09)
	y = lerp(y, mouse_y + 32, 0.09)
	
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