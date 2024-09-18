extends Node

# Constants
const CREDITS_MENU = preload("res://Scenes/_menus/credits_menu.tscn")
const GAME_OVER_SCREEN = preload("res://Scenes/_menus/game_over_screen.tscn")
const MAIN_MENU = preload("res://Scenes/_menus/main_menu.tscn")
const OPTIONS_MENU = preload("res://Scenes/_menus/options_menu.tscn")
const SPLASH_SCREEN = preload("res://Scenes/_menus/splash_screen.tscn")
const WIN_SCREEN = preload("res://Scenes/_menus/win_screen.tscn")
const FIRST_LEVEL = preload("res://Scenes/_levels/level_debug.tscn")

# Runtime Variables
var current_scene: Node = null
var current_scene_packed: PackedScene = null

		
func show_credits():
	_change_scene(CREDITS_MENU)

func show_game_over():
	_change_scene(GAME_OVER_SCREEN)
	
func show_main_menu():
	_change_scene(MAIN_MENU)
	
func show_level_1():
	_change_scene(FIRST_LEVEL)
	
func show_options_menu():
	_change_scene(OPTIONS_MENU)
	
func show_win_screen():
	_change_scene(WIN_SCREEN)
	
func load_scene_by_path(scene):
	
	print(scene)
	if scene is String:
		var scene_resource = load(scene)
		if scene_resource is PackedScene:
			_change_scene(scene_resource)
		else:
			push_error("The loaded resource is not a PackedScene.")
	elif scene is PackedScene:
		_change_scene(scene)
	else:
		push_error("Invalid scene type passed to load_scene_by_path. Expected a String path or a PackedScene.")

func reload_scene():
	call_deferred("_reload_current_scene_deferred")

func _reload_current_scene_deferred():
	var error = get_tree().reload_current_scene()
	
	
func _change_scene(packed_scene: PackedScene):
	call_deferred("_change_scene_deffered", packed_scene)

func _change_scene_deffered(packed_scene: PackedScene):
	if packed_scene == null:
		push_error("PackedScene is null. Cannot change scene.")
		return

	# Change the scene using the SceneTree method
	var error = get_tree().change_scene_to_packed(packed_scene)

	if error != OK:
		push_error("Failed to change scene.")
	else:
		# Update the current scene references if necessary
		current_scene_packed = packed_scene
		current_scene = get_tree().current_scene
