extends CharacterBody2D
@onready var enemy: CharacterBody2D = $"."
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@export var start_direction: int = 1
@export var speed: float = 100

var direction: int = 1  # 1 moves right, -1 moves left
var dir: Vector2
var idle: bool

func _ready():
	intial_d()

func intial_d():
	direction = start_direction

func _process(delta):
	
	
	
	
	if speed == 0:
		if animated_sprite_2d.animation == "eat":
			await get_tree().create_timer(1.0).timeout
			animated_sprite_2d.play("idle")
	if speed != 0:
		animated_sprite_2d.play("fly")
		animated_sprite_2d.flip_h = direction > 0
		velocity = Vector2.RIGHT * direction * speed
		move_and_slide()

func _on_timer_timeout():
	if speed != 0:
		direction *= -1
		animated_sprite_2d.flip_h = direction > 0
	elif speed == 0 and randi() % 2 == 0:
		peck()


#All for idle bird
func peck():
	animated_sprite_2d.play("eat")
