extends Node2D

@onready var color_rect: ColorRect = $CanvasLayer/ColorRect
@onready var level_complete: ColorRect = $CanvasLayer2/LevelComplete
@export var nextLvl : PackedScene
@onready var h_box_container: HBoxContainer = $CenterContainer/HBoxContainer
@onready var next: Button = $CenterContainer/HBoxContainer/Next
@onready var home: Button = $CenterContainer/HBoxContainer/Home

func _ready():

	Events.getmeout.connect(getout)
	Events.start_level.connect(level_label)
	Events.end_level.connect(levelComplete)
	Events.getmetherenow.connect(nextleveltime)

	
func level_label():
	color_rect.hide()
	
	
func levelComplete():
	level_complete.show()
	get_tree().paused = true
	
	if not nextLvl is PackedScene:
		Events.onlyhome.emit()
	else:
		Events.next.emit()

func nextleveltime():
	level_complete.hide()
	await LevelTransition.fade_in()
	get_tree().paused = false
	get_tree().change_scene_to_packed(nextLvl)
	LevelTransition.fade_out()

func getout():
	level_complete.hide()
	await LevelTransition.fade_in()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://menu.tscn")
	LevelTransition.fade_out()

func _process(delta: float) -> void:
	pass
	
	
