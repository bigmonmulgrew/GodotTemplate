extends Node
class_name Options_Manager

const MIN_MOUSE_SENSE: float = 0.02
const MAX_MOUSE_SENSE: float = 3.0
const MIN_FOV: float = 45
const MAX_FOV: float = 120
const MIN_BRIGHTNESS: float = 0.7
const MAX_BRIGHTNESS: float = 1.3

# Variable declarations with 'set' and 'get' for encapsulation
@export_range(MIN_MOUSE_SENSE, MAX_MOUSE_SENSE) var mouse_sensitivity: float = 1
@export_range(0,1) var master_volume: float = 1.0
@export_range(0,1) var music_volume: float = 1.0
@export_range(0,1) var sfx_volume: float = 1.0
@export_range(MIN_FOV,MAX_FOV) var field_of_view: float = 75.0
@export_range(MIN_BRIGHTNESS, MAX_BRIGHTNESS) var brightness: float = 1


# Setters
func Set_Mouse_Sensitivity(value: float) -> void:
	
	if value >= MIN_MOUSE_SENSE and value <= MAX_MOUSE_SENSE:
		mouse_sensitivity = value
	else:
		print("Mouse sensitivity out of valid range")

func Set_Master_Volume(value: float) -> void:
	if value >= 0.0 and value <= 1.0:
		master_volume = value
		AudioManager.update_music_volume()
	else:
		print("Master volume out of valid range")

func Set_Music_Volume(value: float) -> void:
	if value >= 0.0 and value <= 1.0:
		music_volume = value
		AudioManager.update_music_volume()
	else:
		print("Music volume out of valid range")

func Set_SFX_Volume(value: float) -> void:
	if value >= 0.0 and value <= 1.0:
		sfx_volume = value
	else:
		print("SFX volume out of valid range")

func Set_Field_Of_View(value: float) -> void:
	if value >= MIN_FOV and value <= MAX_FOV:
		field_of_view = value
		print("Set Field of view needs to be extended to find the camera. Please extend it and replace this message")
	else:
		print("Field of View out of valid range")

func Set_Brightness(value: float) -> void:
	if value >= MIN_BRIGHTNESS and value <= MAX_BRIGHTNESS:
		brightness = value
		print("Set Field of view needs to be extended to find the environment and other light sorces. Please extend it and replace this message")
	else:
		print("Brightness out of valid range")

# Getters
func Get_Mouse_Sensitivity() -> float:
	return mouse_sensitivity

func Get_Master_Volume() -> float:
	return master_volume

func Get_Music_Volume() -> float:
	return music_volume

func Get_SFX_Volume() -> float:
	return sfx_volume
	
func Get_Field_Of_View() -> float:
	return field_of_view
	
func Get_Brightness() -> float:
	return brightness
