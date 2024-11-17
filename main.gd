extends Node2D

@export var level_scene: PackedScene
@export var player_scene: PackedScene

func _ready():
	instantiate_level_and_players()

func instantiate_level_and_players():
	# Instantiate the level
	var level = level_scene.instantiate()
	add_child(level)
	
	# Instantiate Player 1
	var player1 = player_scene.instantiate()
	level.add_child(player1)
	player1.position = Vector2(0, 0)  # Set the position for Player 1
	player1.initialize(false)  # Initialize Player 1

	# Instantiate Player 2
	var player2 = player_scene.instantiate()
	level.add_child(player2)
	player2.position = Vector2(100, 0)  # Set the position for Player 2
	player2.initialize(true)  # Initialize Player 2
