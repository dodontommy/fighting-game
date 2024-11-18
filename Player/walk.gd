class_name PlayerWalkState
extends PlayerState

const BASE_SPEED: float = 75

func enter() -> void:
	super()
	player.animation.play(walk_anim)

func exit(new_state: State = null) -> void:
	super(new_state)

# Process the physics of the walk state
# In this case, the process physics function will be responsible for transitioning the player
# back to the idle state if the player is not moving, that way we can account for physics of the 
# player slowing down if need be. Also, if we move the state back to 'Idle' from the process_input,
# we then have to account for the player moving in the process_physics function and set the player's
# velocity to 0. Kind of a damned if you do, damned if you don't situation.
func process_physics(delta: float) -> State:
	super(delta)
	var move_dir = get_move_dir()
	do_move(move_dir)
	if get_move_dir() == 0.0: return idle_state
	return null

func process_input(event: InputEvent) -> State:
	super(event)
	if event.is_action_pressed(player.jump_key):
		return jump_state
	return null


func get_move_dir() -> float:
	var left_pressed = Input.is_action_pressed(player.left_key)
	var right_pressed = Input.is_action_pressed(player.right_key)
	if left_pressed and not right_pressed:
		return -1
	elif right_pressed and not left_pressed:
		return 1
	return 0

func do_move(move_dir: float) -> void:
	player.velocity.x = move_dir * BASE_SPEED
