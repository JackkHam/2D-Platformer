extends Area2D

@export var nextLvl : PackedScene
@export var hover_height: float = 5.0  # How high it moves
@export var hover_speed: float = 2.0  # Speed of the hover effect

var start_position: Vector2  # Store the initial position

func _ready():
	start_position = position  # Save original position

func _process(delta):
	position.y = start_position.y + sin(Time.get_ticks_msec() * 0.001 * hover_speed) * hover_height	
	
func _on_body_entered(body: Node2D) -> void:
	queue_free()
	Events.end_level.emit()
	
	
	
