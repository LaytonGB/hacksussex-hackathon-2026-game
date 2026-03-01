extends Node
class_name CharacterStateGlobal


signal state_change(new_state: State, prev_state: State)


enum State {
	STATIONARY,
	WALKING,
	SPRINTING,
	JUMPING,
	CROUCHING,
}


var state := State.STATIONARY:
	set(value):
		state_change.emit(value, state)
		state = value


@export var character: Character


func _physics_process(_delta: float) -> void:
	if character.velocity.is_zero_approx():
		state = State.STATIONARY
		return
	
	match character.state:
		"normal":
			state = State.WALKING
		"crouching":
			state = State.CROUCHING
		"sprinting":
			state = State.SPRINTING
