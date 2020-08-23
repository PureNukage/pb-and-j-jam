if on {
	
	mp_grid_draw(grid.mpGrid)
	
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
		
		draw_set_color(c_white)
		draw_path(path,x,y,true)
		
		draw_set_color(c_black)
		draw_set_alpha(1)
		var xx = x - 128
		var yy = y - 96
		var array = []
		array[state.idle] = "idle"
		array[state.aiming] = "aiming"
		array[state.shoot] = "shoot"
		array[state.walk] = "walk"
		draw_text(xx,yy, "state: " + array[state]) yy += 15
		draw_text(xx,yy, "x: " + string(x)) yy += 15
		draw_text(xx,yy, "y: "+string(y)) yy += 15
		draw_text(xx,yy,"xGoto: "+string(xGoto)) yy += 15
		draw_text(xx,yy, "yGoto: "+string(yGoto)) yy += 15
		draw_text(xx,yy, "pos: "+string(pos)) yy += 15
	}
	
	draw_reset()
			
}