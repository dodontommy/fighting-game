class_name Player
extends CharacterBody2D

@onready var state_machine: StateMachine = $StateMachine
@onready var animation: AnimationPlayer = $Animation
@onready var sprite: AnimatedSprite2D = get_node("Sprite")

var player_2: bool = false
# Input Keys
var movement_key: String
var left_key: String
var right_key: String

# Input Action
var left_actions: Array
var right_actions: Array

func _ready(): state_machine.init()

func _process(delta): state_machine.process_frame(delta)

func _physics_process(delta): state_machine.process_physics(delta)

func _input(event): state_machine.process_input(event)

func initialize(is_player_2: bool):
	player_2 = is_player_2
	sprite.flip_h = player_2
	initialize_keys()

func initialize_keys():
	if player_2:
		movement_key = "Movement_P2"
		left_key = "Left_P2"
		right_key = "Right_P2"
	else:
		movement_key = "Movement"
		left_key = "Left"
		right_key = "Right"

	left_actions = InputMap.action_get_events(left_key).map(func(action: InputEvent) -> String: return action.as_text().get_slice(" (", 0))
	right_actions = InputMap.action_get_events(right_key).map(func(action: InputEvent) -> String: return action.as_text().get_slice(" (", 0))
