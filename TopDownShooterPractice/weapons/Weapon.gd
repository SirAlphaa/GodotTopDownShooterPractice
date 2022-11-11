extends Node2D


signal weaponFired(bullet, location, direction)


export (PackedScene) var Bullet


onready var endOfGun = $EndOfGun
onready var gunDirection = $GunDirection
onready var shootCooldown = $ShootCooldown
onready var animationPlayer = $AnimationPlayer


func shoot():
	print("Player Shot")
	if shootCooldown.is_stopped() and Bullet != null:
		var bullet_instance = Bullet.instance()
		# var target = get_global_mouse_position()
		var direction = endOfGun.global_position.direction_to(gunDirection.global_position).normalized()
		emit_signal("weaponFired", bullet_instance, endOfGun.global_position, direction)
		shootCooldown.start()
		animationPlayer.play("muzzleFlash")
	else:
		print("shoot cooldown active")
		print(shootCooldown.time_left)
