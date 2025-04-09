extends MarginContainer

@onready var start: Button = %Start
@onready var lvl_1b: Button = $CenterContainer/VBoxContainer/HBoxContainer/Lvl1B
@onready var lvl_2b: Button = $CenterContainer/VBoxContainer/HBoxContainer/Lvl2B
@onready var lvl_3b: Button = $CenterContainer/VBoxContainer/HBoxContainer/Lvl3B


func _ready() -> void:
	start.grab_focus()

func _on_start_pressed() -> void:
	await LevelTransition.fade_in()
	get_tree().change_scene_to_file("res://level_1.tscn")
	LevelTransition.fade_out()
	
	
func _on_lvl_1b_pressed() -> void:
	await LevelTransition.fade_in()
	get_tree().change_scene_to_file("res://level_1.tscn")
	LevelTransition.fade_out()


func _on_lvl_2b_pressed() -> void:
	await LevelTransition.fade_in()
	get_tree().change_scene_to_file("res://level_2.tscn")
	LevelTransition.fade_out()


func _on_lvl_3b_pressed() -> void:
	await LevelTransition.fade_in()
	get_tree().change_scene_to_file("res://level_3.tscn")
	LevelTransition.fade_out()

func _on_quit_pressed() -> void:
	get_tree().quit()
