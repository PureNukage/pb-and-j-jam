var centerX = display_get_gui_width()/2
var centerY = display_get_gui_height()/2

//	The player is dead!
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
// The player is alive!
else {
	
	draw_sprite(s_bullet_gui2, player.mag, centerX, 36)
	
	var xx = centerX - 64
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_set_font(fnt_speech)
	draw_text(xx,36,string(player.ammo))
	draw_reset()
}