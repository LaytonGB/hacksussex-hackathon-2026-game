extends VideoStreamPlayer
class_name UiLeftHandVideoManager


@export var _vid_stationary: VideoStreamTheora
@export var _vid_walk: VideoStreamTheora
@export var _vid_crouch: VideoStreamTheora
@export var _vid_sprint: VideoStreamTheora
@export var _vid_jump: VideoStreamTheora


func _ready() -> void:
	CharacterState.state_change.connect(_on_character_state_state_change)


func _on_character_state_state_change(new_state: CharacterState.State, prev_state: CharacterState.State) -> void:
	pass
