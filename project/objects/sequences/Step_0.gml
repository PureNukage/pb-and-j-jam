var Sequence = Sequence_falling
if layer_sequence_is_finished(element) {
	
	with player instance_destroy()
	instance_create_layer(246,413,"Instances",player)
	
	layer_sequence_destroy(element)
	instance_destroy()
}