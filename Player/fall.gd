class_name PlayerFallState
extends PlayerState

func enter() -> void:
	super()
	player.animation.play(fall_anim)

func exit(new_state: State = null) -> void:
	super(new_state)
	player.velocity.y = 0

func process_physics(delta: float) -> State:
	super(delta)
	if(player.is_on_floor()):
		if get_move_dir() != 0:
			return walk_state
		else:
			return idle_state
	player.velocity.y += gravity * delta
	player.move_and_slide()
	return null

func get_move_dir() -> float:
	var left_pressed = Input.is_action_pressed(player.left_key)
	var right_pressed = Input.is_action_pressed(player.right_key)
	if left_pressed and not right_pressed:
		return -1
	elif right_pressed and not left_pressed:
		return 1
	return 0