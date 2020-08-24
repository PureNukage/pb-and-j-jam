var centerX = display_get_gui_width()/2
var centerY = display_get_gui_height()/2

if instance_exists(player) {
	//	The player is dead!
	if !player.alive {
	
		draw_set_color(c_black)
	
		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)
	
		draw_text_transformed(centerX,centerY, "Press <SPACE> to respawn", 3,3, 0)
	
		if input.keyPlaceSpawn {
			player.spawning = true
			player.x = player.spawn.x
			player.y = player.spawn.y
			player.sprite_index = s_player_goo_death
			player.image_index = player.image_number-1
			player.image_speed = 0
			
			sound.playSound(choose(snd_squish1, snd_squish2, snd_squish3))
			
			player.spawnRespawn()
		}
	
	}
	// The player is alive!
	else {
	
	var xx = display_get_gui_width() - 64
	
	draw_sprite(s_bullet_gui2, player.mag, xx, 36)
	
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_set_font(fnt_speech)
	draw_text(xx - 48,36,string(player.ammo))
	draw_reset()
}
}