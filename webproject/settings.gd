extends CanvasLayer

@onready var menu = $MarginContainer3/VBoxContainer
@onready var settings: Button = $MarginContainer/Settings
@onready var v_box_container: VBoxContainer = $MarginContainer3/VBoxContainer
@onready var help: Button = $MarginContainer3/VBoxContainer/Help
@onready var controls: Button = $MarginContainer3/VBoxContainer/Controls
@onready var quit: Button = $MarginContainer3/VBoxContainer/Quit
@onready var margin_container_3: MarginContainer = $MarginContainer3

@onready var help_in: Label = $HelpIn
@onready var close: Button = $Close
@onready var color_rect: ColorRect = $ColorRect
@onready var controls_in: Label = $ControlsIn




func _ready():
	v_box_container.visible = false  # Start hidden
	
	settings.pressed.connect(_toggle_menu)
	help.pressed.connect(help_button)
	controls.pressed.connect(controls_button)
	quit.pressed.connect(quit_button)
	close.pressed.connect(end)
	
	var current_scene = get_tree().current_scene.name
	if current_scene == "StartScreen":  # Adjust name if needed
		self.visible = false
	else:
		self.visible = true

func _toggle_menu():
	v_box_container.visible = !v_box_container.visible  # Show/Hide menu
	end()

# Handle Help button
func help_button():
	if controls_in.visible:
		controls_in.hide()
		help_in.show()
	else:
		help_in.show()
		close.show()
		color_rect.show()

# Handle Goal button
func controls_button():
	if help_in.visible:
		help_in.hide()
		controls_in.show()
	else:
		controls_in.show()
		close.show()
		color_rect.show()

# Handle Quit button
func quit_button():
	await LevelTransition.fade_in()
	get_tree().change_scene_to_file("res://menu.tscn")
	LevelTransition.fade_out()
	
func end():
	if help_in.visible:
		help_in.hide()
		close.hide()
		color_rect.hide()
	elif controls_in.visible:
		controls_in.hide()
		close.hide()
		color_rect.hide()
