extends CharacterBody2D

func _ready():
	global_position = Vector2(165, -281)
	hide()
	add_to_group("Enemy_Adult")
	EnemyMovementManager.acknowledge_character(self)
