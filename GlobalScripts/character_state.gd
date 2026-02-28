extends Node
class_name CharacterStateGlobal


enum State {
	STATIONARY,
	WALKING,
	SPRINTING,
	JUMPING,
	CROUCHING,
}


var state := State.STATIONARY


@onready var _character: Character = get_tree().root.find_child("Character")


func _physics_process(_delta: float) -> void:
	if _character.velocity.is_zero_approx():
		state = State.STATIONARY
		return
	
	match _character.state:
		"normal":
			state = State.WALKING
		"crouching":
			state = State.CROUCHING
		"sprinting":
			state = State.SPRINTING
