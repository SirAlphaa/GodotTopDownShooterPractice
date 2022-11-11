extends KinematicBody2D


var health: int = 100


func handleHit():
	health -= 20
	print("Enemy Hit!", health)
	if health <= 0:
		queue_free()
	pass