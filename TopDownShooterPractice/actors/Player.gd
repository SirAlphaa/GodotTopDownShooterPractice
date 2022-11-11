extends KinematicBody2D


signal playerShotBullet(bullet, position, direction)


export (PackedScene) var Bullet
export (int) var playerSpeed = 100

var health: int = 100


onready var endOfGun = $EndOfGun
onready var gunDirection = $GunDirection
onready var shootCooldown = $ShootCooldown
onready var animationPlayer = $AnimationPlayer


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


func shoot():
	print("Player Shot")
	if shootCooldown.is_stopped():
		var bullet_instance = Bullet.instance()
		# var target = get_global_mouse_position()
		var direction = endOfGun.global_position.direction_to(gunDirection.global_position).normalized()
		emit_signal("playerShotBullet", bullet_instance, endOfGun.global_position, direction)
		shootCooldown.start()
		animationPlayer.play("muzzleFlash")
	else:
		print("shoot cooldown active")
		print(shootCooldown.time_left)

func handleHit():
	health -= 20
	print("Player Hit!", health)
	pass