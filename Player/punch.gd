class_name PlayerPunchState
extends PlayerState

var has_attacked: bool = false
var frame_count: int = 0

func enter() -> void:
	super()
	frame_count = 0
	has_attacked = false
	player.velocity.x = 0
	player.animation.play(punch_anim)
	player.animation.animation_finished.connect(func(_anim): has_attacked = true)

func exit(new_state: State = null) -> void:
	super(new_state)
	print("Punch state was active for %d frames" % frame_count)  # Output the frame count

func process_frame(_delta: float) -> State:
	frame_count += 1
	if has_attacked:
		if Input.is_action_pressed(player.left_key) or Input.is_action_pressed(player.right_key):
			return walk_state
		return idle_state
	return null
