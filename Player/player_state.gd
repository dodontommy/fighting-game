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
var jump_anim: String = "Jump"
var fall_anim: String = "Fall"

#States
@export_group("States")
@export var idle_state: PlayerState
@export var walk_state: PlayerState
@export var jump_state: PlayerState
@export var fall_state: PlayerState

#Utility Functions
func determine_sprite_flipped(event_text: String) -> void:
	if event_text in player.left_actions:
		sprite_flipped = true
	elif event_text in player.right_actions:
		sprite_flipped = false
	sprite.flip_h = sprite_flipped
	
func process_physics(_delta: float) -> State:
	if player.velocity.y > 0: return fall_state
	player.move_and_slide()
	return null

func process_input(event: InputEvent) -> State:
	if event.is_action_pressed(player.movement_key): determine_sprite_flipped(event.as_text())
	return null

func enter() -> void:
	super()
	hurtbox.disabled = false

func exit(new_state: State = null) -> void:
	super()
	hurtbox.disabled = true
	new_state.sprite_flipped = sprite_flipped
