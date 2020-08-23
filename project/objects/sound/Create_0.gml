volume = 1

function playSound(index) {
	audio_play_sound(index, 0, false)
	audio_sound_gain(index, volume, 0)
	debug.log("Playing sound: " + string_upper(string(audio_get_name(index))))
}

audio_play_sound(snd_music, 0 , true)
audio_sound_gain(snd_music, volume, 0)