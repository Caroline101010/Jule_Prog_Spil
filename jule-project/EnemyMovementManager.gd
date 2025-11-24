extends Node

var Character = []
var Current_Enemy = null

#Timer Variables
var SpawnTimer = -1
var SpawnCountdown = 0.5
var Spawn = true

func _ready():
	print("EnemyManager works")

func _process(delta_):
	_countdown_spawn(delta_)
	
func acknowledge_character(New_Character):
	Character.append(New_Character)
	New_Character.global_position = Vector2(148, -442)

func Spawn_Left():
	if Character.size() == 0 or Current_Enemy != null:
		return 
	Character.shuffle()
	var Enemy = Character[0]
	Enemy.global_position = Vector2(14, 182)
	Enemy.show()
	Current_Enemy = Enemy

func Manager_Enemy_Hit(HE):
	if HE and HE in Character:
		HE.global_position = Vector2(84, -124)
		if Current_Enemy == HE:
			Current_Enemy = null
			spawn_countdown(SpawnCountdown)
	if Character.size() == 0:
		return
		
func spawn_countdown(time_seconds):
	SpawnTimer = time_seconds
	Spawn = false
	
func _countdown_spawn(delta):
	if SpawnTimer > 0:
		SpawnTimer -= delta
	elif SpawnTimer <= 0 and not Spawn:
		SpawnTimer = -1
		Spawn = true
		Spawn_Left()
