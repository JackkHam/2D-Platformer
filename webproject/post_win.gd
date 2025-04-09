extends ColorRect

@onready var post_win: ColorRect = $"."
@onready var h_box_container: HBoxContainer = $CenterContainer/HBoxContainer

@onready var next: Button = $CenterContainer/HBoxContainer/Next
@onready var home: Button = $CenterContainer/HBoxContainer/Home

@export var nextLvl : PackedScene

func _ready():
	Events.onlyhome.connect(homeB)
	Events.next.connect(bothB)
	next.pressed.connect(nextlvl)
	home.pressed.connect(backhome)
	
	
func homeB():
	home.show()

func bothB():
	home.show()
	next.show()
	
func nextlvl():
	Events.getmetherenow.emit()
	home.hide()
	next.hide()
	
func backhome():
	Events.getmeout.emit()
	home.hide()
	next.hide()
	
