extends Node2D


onready var bulletManager = $BulletManager
onready var player = $Player

func _ready():
	player.connect("playerShotBullet", bulletManager, "handleBulletSpawned")
	pass

