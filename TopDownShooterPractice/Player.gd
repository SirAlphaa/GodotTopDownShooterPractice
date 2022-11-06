extends KinematicBody2D


export (PackedScene) var Bullet
export (int) var playerSpeed = 100


onready var endOfGun = $EndOfGun


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


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		shoot()
		pass


func shoot():
	print("Player Shot")
	var bullet_instance = Bullet.instance()
	add_child(bullet_instance)
	bullet_instance.global_position = endOfGun.global_position
	var target = get_global_mouse_position()
	var directionToMouse = bullet_instance.global_position.direction_to(target).normalized()
	bullet_instance.set_direction(directionToMouse)