class_name PlayerPunchState
extends PlayerState

var has_attacked: bool = false

func enter() -> void:
	super()
	print(Engine.get_frames_per_second()  )
	has_attacked = false
	player.velocity.x = 0
	player.animation.play(punch_anim)
	player.animation.animation_finished.connect(func(_anim): has_attacked = true)

func exit(new_state: State = null) -> void:
	super(new_state)

func process_frame(_delta: float) -> State:
	if has_attacked:
		if Input.is_action_pressed(player.left_key) or Input.is_action_pressed(player.right_key):
			return walk_state
		return idle_state
	return null
