var Sequence = Sequence_falling
if layer_sequence_is_finished(element) {
	
	player.x = 340
	player.spawn.x = 340
	player.alive = false
	player.sprite_index = s_player_fall
	player.visible = true
	player.canControl = true
	
	layer_sequence_destroy(element)
	instance_destroy()
}