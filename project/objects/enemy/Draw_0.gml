if imDamaged {
	shader_set(shader_flash)	
}

if !alive {
	bloodPuddle()	
}

draw_self()
shader_reset()