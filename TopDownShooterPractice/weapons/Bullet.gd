extends Area2D
class_name Bullet

export (int) var bulletSpeed = 20

onready var kill_timer = $KillTimer 

func _ready():
	kill_timer.start()


var direction := Vector2.ZERO


func _physics_process(delta):
	
	if direction != Vector2.ZERO:
		var velocity = direction * bulletSpeed
		global_position += velocity

	
	

func set_direction(direction: Vector2):
	self.direction = direction
	rotation += direction.angle()

func _on_KillTimer_timeout():
	queue_free()


func _on_Bullet_body_entered(body:Node):
	if body.has_method('handleHit'):
		body.handleHit()
		queue_free()
	pass
