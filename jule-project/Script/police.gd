extends CharacterBody2D

func _ready():
	global_position = Vector2(148, -442)
	hide()
	add_to_group("Enemy_Police")
	EnemyMovementManager.acknowledge_character(self)
