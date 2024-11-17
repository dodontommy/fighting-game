class_name PlayerState
extends State

@onready var player: Player = get_parent().get_parent()
@onready var sprite: AnimatedSprite2D = player.get_node("Sprite")

var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity", -9.8)

#State Variables
var sprite_flipped: bool = false

#Animation Names
var idle_anim: String = "Idle"
var walk_anim: String = "Walk"

#States
@export_group("States")
@export var idle_state: PlayerState
@export var walk_state: PlayerState

#Utility Functions
func determine_sprite_flipped(event_text: String) -> void:
	if event_text in player.left_actions:
		sprite_flipped = true
	elif event_text in player.right_actions:
		sprite_flipped = false
	sprite.flip_h = sprite_flipped
	
func process_physics(delta: float) -> State:
	player.velocity.y += gravity * delta
	player.move_and_slide()
	return null

func exit(new_state: State = null) -> void:
	super()
	new_state.sprite_flipped = sprite_flipped
