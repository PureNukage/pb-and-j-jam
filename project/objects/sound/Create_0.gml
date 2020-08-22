volume = 1

function playSound(index) {
	audio_play_sound(index, 0, false)
	audio_sound_gain(index, volume, 0)
	debug.log("Playing sound: " + string_upper(string(audio_get_name(index))))
}