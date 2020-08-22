if on {
	
	//mp_grid_draw(grid.mpGrid)
	
	if instance_exists(class_grab) with class_grab {
		draw_set_color(c_red)
		draw_set_alpha(0.5)
		draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,false)
	}
	
	if instance_exists(player) with player {
		draw_set_color(c_red)
		draw_set_alpha(0.5)
		draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,false)
	}
	
	if instance_exists(enemy) with enemy {
		if xGoto and yGoto > -1 {
			var Scale = 0.25
			draw_sprite_ext(s_debug, 0, xGoto, yGoto, Scale,Scale, 0, c_white, 1)	
		}
	}
	
	draw_reset()
			
}