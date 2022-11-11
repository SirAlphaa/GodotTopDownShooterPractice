extends KinematicBody2D
class_name Player

signal playerShotBullet(bullet, position, direction)

export (int) var playerSpeed = 100

onready var weapon = $Weapon
onready var healthStat = $Health

func _ready():
	weapon.connect("weaponFired", self, "shoot")

func _physics_process(delta:float) -> void:

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
		weapon.shoot()
		
		
func shoot(bullet_instance, location: Vector2, direction: Vector2):
	print("========")
	emit_signal("playerShotBullet", bullet_instance, location, direction)
			
func handleHit():
	healthStat.health -= 20
	print("Player Hit!", healthStat)
	pass