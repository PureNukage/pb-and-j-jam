var centerX = display_get_gui_width()/2
var centerY = display_get_gui_height()/2

if !player.alive {
	
	draw_set_color(c_black)
	
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	
	draw_text_transformed(centerX,centerY, "Press <SPACE> to respawn", 3,3, 0)
	
	if input.keyPlaceSpawn {
		player.alive = true
		player.x = player.spawn.x
		player.y = player.spawn.y
		player.sprite_index = s_player_front
	}
	
}

else {
	if player.mag > 0 {
		var xx = centerX - (32*3)
		var yy = 60
		for(var i=0;i<player.mag;i++) {
			draw_sprite(s_bullet_gui, 0, xx,yy)
			xx += 32
		}
	}
	
	var xx = centerX - (32*4)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_set_font(fnt_speech)
	draw_text(xx,60,string(player.ammo))
	draw_reset()
}