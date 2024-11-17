class_name PlayerWalkState
extends PlayerState

const SPEED: float = 75

func enter() -> void:
	print("Player is walking")
	player.animation.play(walk_anim)

func process_input(event: InputEvent) -> State:
	if event.is_action_pressed(movement_key):
		return walk_state
	return null

func process_physics(delta: float) -> State:
	super(delta)
	var move_dir = get_move_dir()
	do_move(move_dir)
	if move_dir == 0:
		return idle_state
	return null

func get_move_dir() -> float: return Input.get_axis(left_key, right_key)

func do_move(move_dir: float) -> void:
	player.velocity.x = move_dir * SPEED
