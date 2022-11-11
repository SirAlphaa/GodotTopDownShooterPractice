extends Node2D


export (int) var health = 100 setget setHealth

func setHealth(new_health: int):
	health = clamp(new_health, 0, 100)