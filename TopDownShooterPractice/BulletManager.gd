extends Node2D


func handleBulletSpawned(Bullet: Bullet, position: Vector2, direction: Vector2):
	print("Bullet spawned")
	add_child(Bullet)
	Bullet.global_position = position
	Bullet.set_direction(direction)