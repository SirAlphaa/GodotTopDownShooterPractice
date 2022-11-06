extends Area2D


export (int) var bulletSpeed = 10


func _ready():
	pass # Replace with function body.


var direction := Vector2.ZERO


func _physics_process(delta):
	
	if direction != Vector2.ZERO:
		var velocity = direction * bulletSpeed
		global_position += velocity

	
	

func set_direction(direction: Vector2):
	self.direction = direction