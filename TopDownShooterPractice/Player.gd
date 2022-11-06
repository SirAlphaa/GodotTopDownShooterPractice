extends KinematicBody2D


export (int) var playerSpeed = 100


func _ready():
	pass # Replace with function body.


func _process(delta:float) -> void:

	var movement_direction := Vector2.ZERO

	if Input.is_action_pressed("up"):
		movement_direction.y = -1

	if Input.is_action_pressed("down"):
		movement_direction.y = 1

	if Input.is_action_pressed("left"):
		movement_direction.x = -1

	if Input.is_action_pressed("right"):
		movement_direction.x = 1

	movement_direction = movement_direction.normalized()

	move_and_slide(movement_direction * playerSpeed)

	look_at(get_global_mouse_position())