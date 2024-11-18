class_name PlayerJumpState
extends PlayerState

const BASE_FORCE: float = -250

var jump_frame_count: int = 0

func enter() -> void:
	super()
	jump_frame_count = 0
	player.velocity.y = BASE_FORCE
	player.animation.play(jump_anim)

func exit(new_state: State = null) -> void:
	super(new_state)
	player.velocity.y = 0

func process_physics(delta: float) -> State:
	super(delta)
	if player.velocity.y >= 0: return fall_state
	player.velocity.y += (gravity * delta)
	player.move_and_slide()
	return null
