if grabbed {
	draw_set_color(c_lime)
	draw_set_alpha(0.3)
	var Width = sprite_get_width(sprite_index)
	var Height = sprite_get_height(sprite_index)
	var Thick = 4
	
	draw_rectangle(x-Width/2 - Thick,y-z-Height/2 - Thick, x-Width/2+Width + Thick,y-z-Height/2+Height + Thick,false)
	
	draw_reset()
}

//	Draw shadow 
if !onGround {
	draw_set_color(c_black)
	draw_set_alpha(0.3)
	var Width = sprite_get_width(sprite_index)
	var Height = sprite_get_height(sprite_index)
	draw_rectangle(x - Width/2 + (z/4), y + Height/2 + z - 8, x - Width/2 + Width - (z/4),  y + Height/2 + z + 8, false)
	
	draw_reset()
}

//draw_self()
draw_sprite_ext(sprite_index,image_index,x,y-z,image_xscale,image_yscale,image_angle,c_white,1)