class_name PlayerJumpState
extends PlayerState

const BASE_FORCE: float = 2.5
const JUMP_FRAMES: int = 30

var jump_frame_count: int = 0

func enter() -> void:
	super()
	jump_frame_count = 0
	player.velocity.y -= BASE_FORCE
	player.animation.play(jump_anim)

func exit(new_state: State = null) -> void:
	super(new_state)
	player.velocity.y = 0

func process_physics(delta: float) -> State:
	super(delta)
	jump_frame_count += 1
	if jump_frame_count >= JUMP_FRAMES:
		return fall_state
	player.velocity.y -= (gravity * delta) / BASE_FORCE
	print('jump frame count: ' + str(jump_frame_count))
	player.move_and_slide()
	return null
