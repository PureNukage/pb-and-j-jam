//	Draw spawnpoint
if spawn.x > -1 and spawn.y > -1 {
	draw_sprite(s_goospawn,0,spawn.x,spawn.y)	
}

//	Draw shadow
draw_set_color(c_black)
draw_set_alpha(0.3)
mask_index = s_player_hitbox
draw_ellipse(bbox_left,bbox_top+16,bbox_right,bbox_bottom,false)
mask_index = s_demon

draw_reset()

draw_self()