class_name PlayerState
extends State

@onready var player: Player = get_parent().get_parent()

var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity", -9.8)

#Animation Names
var idle_anim: String = "Idle"
var walk_anim: String = "Walk"

#States
@export_group("States")
@export var idle_state: PlayerIdleState
@export var walk_state: PlayerWalkState

#Input Keys
var movement_key: String = "Movement"
var left_key: String = "Left"
var right_key: String = "Right"

func process_physics(delta: float) -> State:
	player.velocity.y += gravity * delta
	player.move_and_slide()
	return null
