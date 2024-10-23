extends Node

@onready var music_player: AudioStreamPlayer = $"Music Player"

# Configurations
@export var ambient_music: AudioStream

# Cached references
var main_camera: Camera3D

func _ready() -> void:
	attach_to_player()

	play_track(ambient_music)

func attach_to_player() -> void:
	# Find the main camera in the scene and attach the AudioStreamPlayer to it
	main_camera = get_viewport().get_camera_3d()
	if not main_camera:
		print("Main Camera not found, attaching music source to AudioManager node itself.")
		if music_player.get_parent():
			music_player.get_parent().remove_child(music_player)
		add_child(music_player)
	else:
		print("Main Camera found, attaching music source to it.")
		if music_player.get_parent():
			music_player.get_parent().remove_child(music_player)
		main_camera.add_child(music_player)
		
func play_track(track: AudioStream) -> void:
	if music_player.stream == track:
		if not music_player.playing:
			music_player.play()
	else:
		music_player.stream = track
		music_player.play()

	update_music_volume()

func update_music_volume() -> void:
	var master_volume = OptionsManager.Get_Master_Volume()
	var music_volume = OptionsManager.Get_Music_Volume()
	music_player.volume_db = linear_to_db(master_volume * music_volume)

func pause_music() -> void:
	music_player.stop()

# Play an audio clip at a specified position in the world
func play_clip(clip: AudioStream, play_position = null, volume: float = 1.0):
	if not clip:
		print("Attempting to play clip when clip is null")
		return

	# Cap volume to be between 0 and 1
	volume = clamp(volume, 0, 1)
	
	# If no position is specified, use the position of this node
	var position = play_position if play_position else main_camera.global_transform.origin

	# Create a temporary AudioStreamPlayer3D for playing the clip
	var audio_player = AudioStreamPlayer3D.new()
	add_child(audio_player)
	audio_player.stream = clip
	audio_player.global_transform.origin = position

	var master_volume = OptionsManager.Get_Master_Volume()
	var sfx_volume = OptionsManager.Get_SFX_Volume()

	# Calculate final volume based on master and effects volumes
	# Clamping as an extra safety check and incase of rounding errors
	var final_volume = clamp(volume * master_volume * sfx_volume, 0, 1)
	audio_player.volume_db = linear_to_db(final_volume)

	audio_player.play()

	# Automatically free the player after playback completes
	audio_player.connect("finished", Callable(audio_player, "queue_free"))
