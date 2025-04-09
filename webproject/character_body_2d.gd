extends CharacterBody2D


@onready var SPEED = 100.0
@onready var JUMP_VELOCITY = -400.0
const ACCELERATION = 200
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var air_jump = false
@onready var starting_position = global_position

func _physics_process(delta: float) -> void:
	# Add the gravity.
	move_and_slide()
	
	if is_on_floor():		
		
		air_jump = true
		
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = JUMP_VELOCITY
	else:
		if Input.is_action_just_released("ui_accept") and velocity.y < JUMP_VELOCITY / 2:
			velocity.y = JUMP_VELOCITY / 2
		
	if not is_on_floor():
		velocity += get_gravity() * delta
		
		if air_jump:
			if Input.is_action_just_pressed("ui_accept"):
				velocity.y = JUMP_VELOCITY * .7
				air_jump = false

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	update_animations(direction)
	if direction:
		velocity.x = move_toward(velocity.x, SPEED * direction, ACCELERATION * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

func update_animations(direction):
	if direction != 0:
		animated_sprite_2d.flip_h = direction < 0
		animated_sprite_2d.play("running")
		Events.start_level.emit()
	else:
		animated_sprite_2d.play("idle")
		
	if not is_on_floor():
		animated_sprite_2d.play("jump")
		
		
	
	


func _on_hazard_detect_area_entered(area: Area2D) -> void:
	global_position = starting_position
