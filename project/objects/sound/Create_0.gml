volume = 5
music_volume = 0.2

function playSound(index) {
	audio_play_sound(index, 0, false)
	audio_sound_gain(index, volume, 0)
	debug.log("Playing sound: " + string_upper(string(audio_get_name(index))))
}

audio_play_sound(snd_music, 0 , true)
audio_sound_gain(snd_music, music_volume, 0)