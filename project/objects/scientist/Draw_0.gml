if imDamaged {
	shader_set(shader_flash)
}

draw_self()
shader_reset()

if shields {
	draw_sprite(s_shields,image_index,x,y)	
}

if blowingUp {
	if blowingUpTimer > 0 blowingUpTimer--
	else {
		
		var X = irandom_range(512, 895)
		var Y = irandom_range(0, 256)
		instance_create_layer(X,Y,"Instances",explosion)
		blowingUpTimer = 8
	}
}