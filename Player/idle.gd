class_name PlayerIdleState
extends PlayerState

func enter() -> void:
	super()
	player.animation.play(idle_anim)
	player.velocity.x = 0

func exit(new_state: State = null) -> void:
	super(new_state)

func process_input(event: InputEvent) -> State:
	super(event)
	if event.is_action_pressed(player.movement_key) or (event.is_action_released(player.movement_key)):
		return walk_state
	else: if event.is_action_pressed(player.jump_key):
		return jump_state
	return null
