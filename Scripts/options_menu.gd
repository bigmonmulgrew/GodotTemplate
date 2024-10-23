extends Control

@onready var master_volume_slider: HSlider = $"Options Backing/MasterVolumeLabel/MasterVolumeSlider"
@onready var music_volume_slider: HSlider = $"Options Backing/MusicVolumeLabel/MusicVolumeSlider"
@onready var sfx_volume_slider: HSlider 	= $"Options Backing/SFXVolumeLabel/SFXVolumeSlider"
@onready var look_sensitivity_slider: HSlider = $"Options Backing/MouseSensitivityLabel/LookSensitivitySlider"
@onready var fov_slider: HSlider = $"Options Backing/FOV Label/FOVSlider"
@onready var brightness_slider: HSlider = $"Options Backing/Brightness Label/BrightnessSlider"

var b_ready:bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_setup_sliders()
	b_ready = true

func _setup_sliders() -> void:
	master_volume_slider.value = OptionsManager.Get_Master_Volume()
	music_volume_slider.value = OptionsManager.Get_Music_Volume()
	sfx_volume_slider.value = OptionsManager.Get_SFX_Volume()
	
	look_sensitivity_slider.min_value = OptionsManager.MIN_MOUSE_SENSE
	look_sensitivity_slider.max_value = OptionsManager.MAX_MOUSE_SENSE
	look_sensitivity_slider.value = OptionsManager.Get_Mouse_Sensitivity()	
	
	fov_slider.min_value = OptionsManager.MIN_FOV
	fov_slider.max_value = OptionsManager.MAX_FOV
	fov_slider.value = OptionsManager.Get_Field_Of_View()	
	
	brightness_slider.min_value = OptionsManager.MIN_BRIGHTNESS
	brightness_slider.max_value = OptionsManager.MAX_BRIGHTNESS
	brightness_slider.value = OptionsManager.Get_Brightness()
	
func _on_master_volume_slider_value_changed(value: float) -> void:
	# Early exit to prevent this running before _ready is called on the first frame
	if not b_ready: return
	
	OptionsManager.Set_Master_Volume(value)

func _on_music_volume_slider_value_changed(value: float) -> void:
	# Early exit to prevent this running before _ready is called on the first frame
	if not b_ready: return
	
	OptionsManager.Set_Music_Volume(value)

func _on_sfx_volume_slider_value_changed(value: float) -> void:
	# Early exit to prevent this running before _ready is called on the first frame
	if not b_ready: return
	
	OptionsManager.Set_SFX_Volume(value)

func _on_look_sensitivity_slider_value_changed(value: float) -> void:
	# Early exit to prevent this running before _ready is called on the first frame
	if not b_ready: return
	
	OptionsManager.Set_Mouse_Sensitivity(value)

func _on_fov_slider_value_changed(value: float) -> void:
	# Early exit to prevent this running before _ready is called on the first frame
	if not b_ready: return
	
	OptionsManager.Set_Field_Of_View(value)

func _on_brightness_slider_value_changed(value: float) -> void:
	# Early exit to prevent this running before _ready is called on the first frame
	if not b_ready: return
	
	OptionsManager.Set_Brightness(value)

func _on_button_button_down() -> void:
	LevelManager.show_main_menu()
